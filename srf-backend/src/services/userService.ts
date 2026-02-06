import { compare, hash } from "bcryptjs";
import { prisma } from "..";
import { createUserRequest, updateUserRequest, loginRequest } from "../models/userModel";
import { sign } from "jsonwebtoken";
import { sendEmail } from "../libs/mailtrap";

class UserService {

    async createUser(data: any) {
        // Verificações
        const { name, email, password, role } = createUserRequest.parse(data);

        const userAlreadyExists = await prisma.user.findUnique({
            where: { email: email.toLowerCase() }
        });
        if (userAlreadyExists) throw new Error('Email já cadastrado');

        // Criação do usuário
        const passwordHash = await hash(password, 10);
        let roleIdFound: string | undefined;
        if (role) {
            const roleData = await prisma.role.findFirst({
                where: { name: role },
                select: { id: true }
            });
            if (!roleData) throw new Error('Função informada não existe');

            roleIdFound = roleData.id;
        }
        const user = await prisma.user.create({
            data: {
                name: name,
                email: email.toLowerCase(),
                password: passwordHash,
                roleId: roleIdFound!,
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

    async updateUser(data: any, requesterId: string) {
        // Verificações
        const { userId, name, email, password, userPic, role, userAccess } = updateUserRequest.parse(data);

        const targetUser = await prisma.user.findUnique({
            where: { id: userId },
            include: { role: true }
        });
        if (!targetUser) throw new Error('Usuário não encontrado');
        if (targetUser.role?.name === 'owner' && userId !== requesterId) throw new Error('Outros usuários não podem alterar um usuário dono');


        const hasData = [name, email, password, userPic, role, userAccess].some(
            field => field !== undefined && (typeof field === 'string' ? field.trim() !== '' : true)
        );
        if (!hasData) throw new Error('Nenhum dado válido foi fornecido');

        const dataToChange: any = {};
        if (name?.trim()) dataToChange.name = name;
        if (email?.trim()) dataToChange.email = email;
        if (password?.trim()) dataToChange.password = await hash(password, 10);
        if (userPic?.trim()) dataToChange.userPic = userPic;
        if (role?.trim()) {
            if (targetUser.role?.name === 'owner') throw new Error('Função dono não pode ser atribuída ou removida');
            const roleFound = await prisma.role.findFirst({
                where: { name: role }
            });
            if (!roleFound) throw new Error('Função não existe');
            if (roleFound.name === 'owner') throw new Error('Função dono não pode ser atribuída ou removida');
            dataToChange.roleId = roleFound.id;
        }

        // Alteração
        return await prisma.$transaction(async (tx) => {
            const updateUser = await tx.user.update({
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

            if (userAccess) {
                await tx.userAccess.deleteMany({ where: { userId: userId } });

                if (userAccess.length > 0) {
                    for (const access of userAccess) {
                        const form = await tx.form.findFirst({ where: { name: access.form } });
                        if (!form) throw new Error(`Formulário '${access.form}' não encontrado`);
                        await tx.userAccess.create({
                            data: {
                                userId: userId,
                                formId: form.id,
                                accessLevel: access.level,
                            }
                        });
                    }
                }
            }

            return updateUser;
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
        if (!user) throw new Error('Email não cadastrado');

        const password = Math.random().toString(36).slice(-8);
        await this.updateUser({ userId: user.id, password: password }, user.id);
        await sendEmail(email, 'Recuperação de Senha', 'Sua nova senha: ' + password);
        return password;
    }

}

export { UserService };