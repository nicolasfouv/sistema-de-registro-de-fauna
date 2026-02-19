import { compare, hash } from "bcryptjs";
import { prisma } from "..";
import { createUserRequest, loginRequest, updateUserPicRequest, updateUserAccessRequest, updateUserDetailsRequest, updateUserPasswordRequest } from "../models/userModel";
import { sign } from "jsonwebtoken";
import { sendEmail } from "../libs/mailtrap";

class UserService {

    async createUser(data: any) {
        // Verificações
        const { name, email, password } = createUserRequest.parse(data);

        const userAlreadyExists = await prisma.user.findUnique({
            where: { email: email.toLowerCase() }
        });
        if (userAlreadyExists) throw new Error('Email já cadastrado');

        // Criação do usuário
        const passwordHash = await hash(password, 10);

        const user = await prisma.user.create({
            data: {
                name: name,
                email: email.toLowerCase(),
                password: passwordHash,
            },
            select: {
                id: true,
                name: true,
                email: true,
                role: { select: { name: true } }
            }
        });
        return user;
    }

    async deleteUser(targetId: string, requesterId: string) {
        // Verificações
        if (targetId === requesterId) throw new Error('Usuário não pode excluir a si mesmo');
        if (!targetId) throw new Error('Identificador (ID) é obrigatório');

        const user = await prisma.user.findUnique({
            where: { id: targetId },
            include: { role: { select: { name: true } } }
        });
        if (!user) throw new Error('Usuario não encontrado');

        const isAdmin = user?.role?.name === 'admin' || user?.role?.name === 'owner';
        if (isAdmin) throw new Error('Usuarios admins/donos não podem ser excluídos');

        // Remoção dos acessos específicos do usuário
        const userAccessIds = await prisma.userAccess.findMany({ where: { userId: targetId }, select: { id: true } });
        const idsToDelete = userAccessIds.map((item) => item.id);
        await prisma.userAccess.deleteMany({ where: { id: { in: idsToDelete } } });

        // Remoção do usuário
        const deletedUser = await prisma.user.delete({ where: { id: targetId } });
        return deletedUser;
    }

    async updateUserDetails(data: any, requesterId: string) {
        const { userId, name, email, role } = updateUserDetailsRequest.parse(data);

        const targetUser = await prisma.user.findUnique({
            where: { id: userId },
            include: { role: true }
        });
        if (!targetUser) throw new Error('Usuário não encontrado');
        if (targetUser.role?.name === 'owner' && userId !== requesterId) throw new Error('Outros usuários não podem alterar um usuário dono');

        if (targetUser.email !== email.toLowerCase()) {
            const userAlreadyExists = await prisma.user.findUnique({
                where: { email: email.toLowerCase() }
            });
            if (userAlreadyExists) throw new Error('Email já cadastrado');
        }

        const dataToChange: any = { name, email };

        if (targetUser.role?.name === 'owner' && role !== 'owner') throw new Error('Função dono não pode ser removida');

        const roleFound = await prisma.role.findFirst({
            where: { name: role }
        });
        if (!roleFound) throw new Error('Função não existe');
        if (roleFound.name === 'owner' && targetUser.role?.name !== 'owner') throw new Error('Função dono não pode ser atribuída');
        dataToChange.roleId = roleFound.id;

        return await prisma.user.update({
            where: { id: userId },
            data: dataToChange,
            select: {
                id: true,
                name: true,
                email: true,
                userPic: true,
                role: { select: { name: true } }
            }
        });
    }

    async updateUserPic(data: any, requesterId: string) {
        const { userId, userPic } = updateUserPicRequest.parse(data);

        const targetUser = await prisma.user.findUnique({ where: { id: userId }, include: { role: true } });

        if (!targetUser) throw new Error('Usuário não encontrado');
        if (targetUser.role?.name === 'owner' && userId !== requesterId) throw new Error('Outros usuários não podem alterar um usuário dono');

        return await prisma.user.update({
            where: { id: userId },
            data: { userPic: userPic || null },
            select: { id: true, userPic: true }
        });
    }

    async updateUserAccess(data: any, requesterId: string) {
        const { userId, userAccess } = updateUserAccessRequest.parse(data);

        const targetUser = await prisma.user.findUnique({ where: { id: userId }, include: { role: true } });
        if (!targetUser) throw new Error('Usuário não encontrado');
        if (targetUser.role?.name === 'owner' && userId !== requesterId) throw new Error('Outros usuários não podem alterar um usuário dono');

        return await prisma.$transaction(async (tx) => {
            await tx.userAccess.deleteMany({ where: { userId: userId } });

            if (userAccess.length > 0) {
                for (const access of userAccess) {
                    const form = await tx.form.findFirst({ where: { id: access.formId } });
                    if (!form) throw new Error(`Formulário '${access.formId}' não encontrado`);

                    let accessLevelId: string | null = null;
                    if (access.accessLevelId) {
                        const foundAccessLevel = await tx.enumAccessLevel.findFirst({ where: { id: access.accessLevelId } });
                        if (foundAccessLevel) accessLevelId = foundAccessLevel.id;
                    }
                    await tx.userAccess.create({
                        data: {
                            userId: userId,
                            formId: form.id,
                            accessLevelId: accessLevelId
                        }
                    });
                }
            }
            return { message: 'Acessos atualizados com sucesso' };
        });
    }

    async updateUserPassword(data: any, requesterId: string) {
        const { userId, password } = updateUserPasswordRequest.parse(data);

        const targetUser = await prisma.user.findUnique({ where: { id: userId }, include: { role: true } });
        if (!targetUser) throw new Error('Usuário não encontrado');
        if (targetUser.role?.name === 'owner' && userId !== requesterId) throw new Error('Outros usuários não podem alterar um usuário dono');

        const passwordHash = await hash(password, 10);

        return await prisma.user.update({
            where: { id: userId },
            data: { password: passwordHash },
            select: { id: true }
        });
    }

    async login(data: any) {
        // Verificações
        const { email, password } = loginRequest.parse(data);
        const user = await prisma.user.findUnique({
            where: { email: email.toLowerCase() },
            select: {
                id: true,
                name: true,
                email: true,
                password: true,
                userPic: true,
                role: { select: { name: true } }
            }
        });
        if (!user) throw new Error('Email incorreto');

        const passwordMatch = await compare(password, user.password);
        if (!passwordMatch) throw new Error('Senha incorreta');

        // Login
        const token = sign(
            {
                name: user.name,
                email: user.email,
            },
            process.env.JWT_SECRET as string,
            {
                subject: user.id,
                expiresIn: '7d',
            }
        );
        return {
            user: {
                id: user.id,
                name: user.name,
                email: user.email,
                role: user.role.name,
                userPic: user.userPic,
            },
            token: token,
        };
    }

    async getUsers() {
        const users = await prisma.user.findMany({
            select: {
                id: true,
                name: true,
                email: true,
                userPic: true,
                role: { select: { name: true } }
            }
        });
        return users;
    }

    async forgotPassword(email: string) {
        const user = await prisma.user.findUnique({ where: { email: email.toLowerCase() } });
        if (!user) return "Usuário não encontrado";

        const password = Math.random().toString(36).slice(-8);
        await this.updateUserPassword({ userId: user.id, password: password }, user.id);
        await sendEmail(email, 'Recuperação de Senha', 'Sua nova senha: ' + password);
        return "Senha enviada com sucesso";
    }

    async getUserAccess(userId: string) {
        if (!userId) throw new Error('ID do usuário não fornecido');
        const user = await prisma.user.findUnique({ where: { id: userId } });
        if (!user) throw new Error('Usuário não encontrado');
        const userAccess = await prisma.userAccess.findMany({
            where: { userId: userId },
            select: {
                form: {
                    select: {
                        id: true,
                    }
                },
                enumAccessLevel: true,

            }
        });
        return userAccess.map((access) => {
            return {
                formId: access.form.id,
                accessLevelId: access.enumAccessLevel?.id,
            };
        });
    }
}

export { UserService };