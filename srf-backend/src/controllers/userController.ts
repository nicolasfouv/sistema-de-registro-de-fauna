import { Request, Response } from "express";
import { UserService } from "../services/userService";
import { ZodError } from "zod";

class UserController {

    async createUser(req: Request, res: Response) {
        try {
            const data = req.body;
            const userService = new UserService()
            const user = await userService.createUser(data);
            return res.status(201).json(user);
        } catch (error: any) {
            if (error instanceof ZodError) {
                return res.status(400).json({
                    message: error.flatten().fieldErrors,
                });
            }
            if (error.message === 'Email já cadastrado') return res.status(409).json({ message: error.message });
            if (error.message === 'Função informada não existe') return res.status(400).json({ message: error.message });
            return res.status(500).json({ message: 'Erro interno' });
        }
    }

    async deleteUser(req: Request, res: Response) {
        try {
            const targetId = req.query.user_id as string;
            const requesterId = req.userId;
            const userService = new UserService();
            await userService.deleteUser(targetId, requesterId);
            return res.status(200).json('Usuário excluído');
        } catch (error: any) {
            if (error.message === 'Identificador (ID) é obrigatório') return res.status(400).json({ message: error.message });
            if (error.message === 'Usuário não pode excluir a si mesmo') return res.status(400).json({ message: error.message });
            if (error.message === 'Usuarios admins não podem ser excluídos') return res.status(403).json({ message: error.message });
            if (error.message === 'Usuario não encontrado') return res.status(400).json({ message: error.message })
            return res.status(500).json({ message: 'Erro interno' });
        }
    }

    async updateUserDetails(req: Request, res: Response) {
        try {
            const { userId, name, email, role } = req.body;
            const requesterId = req.userId;
            const userService = new UserService();
            const updatedUser = await userService.updateUserDetails(
                { userId, name, email, role },
                requesterId as string
            );

            return res.status(200).json(updatedUser);
        } catch (error: any) {
            if (error instanceof ZodError) {
                return res.status(400).json({
                    message: error.flatten().fieldErrors,
                });
            }
            if (error.message === 'Usuário não encontrado') return res.status(404).json({ message: error.message });
            if (error.message === 'Outros usuários não podem alterar um usuário dono') return res.status(403).json({ message: error.message });
            if (error.message === 'Função não existe') return res.status(400).json({ message: error.message });
            if (error.message === 'Função dono não pode ser removida' || error.message === 'Função dono não pode ser atribuída') return res.status(403).json({ message: error.message });
            if (error.message === 'Email já cadastrado') return res.status(409).json({ message: error.message });
            return res.status(500).json({ error: "Erro interno" });
        }
    }

    async updateUserPic(req: Request, res: Response) {
        try {
            const { userId, userPic } = req.body;
            const requesterId = req.userId;
            const userService = new UserService();
            const updatedUser = await userService.updateUserPic(
                { userId, userPic },
                requesterId as string
            );
            return res.status(200).json(updatedUser);
        } catch (error: any) {
            if (error instanceof ZodError) return res.status(400).json({ message: error.flatten().fieldErrors });
            if (error.message === 'Usuário não encontrado') return res.status(404).json({ message: error.message });
            if (error.message === 'Outros usuários não podem alterar um usuário dono') return res.status(403).json({ message: error.message });
            return res.status(500).json({ error: "Erro interno" });
        }
    }

    async updateUserAccess(req: Request, res: Response) {
        try {
            const { userId, userAccess } = req.body;
            const requesterId = req.userId;
            const userService = new UserService();
            const result = await userService.updateUserAccess(
                { userId, userAccess },
                requesterId as string
            );
            return res.status(200).json(result);
        } catch (error: any) {
            if (error instanceof ZodError) return res.status(400).json({ message: error.flatten().fieldErrors });
            if (error.message === 'Usuário não encontrado') return res.status(404).json({ message: error.message });
            if (error.message === 'Outros usuários não podem alterar um usuário dono') return res.status(403).json({ message: error.message });
            // Add other specific error handling as needed
            return res.status(500).json({ error: "Erro interno" });
        }
    }

    async updateUserPassword(req: Request, res: Response) {
        try {
            const { userId, password } = req.body;
            const requesterId = req.userId;
            const userService = new UserService();
            const result = await userService.updateUserPassword(
                { userId, password },
                requesterId as string
            );
            return res.status(200).json(result);
        } catch (error: any) {
            if (error instanceof ZodError) return res.status(400).json({ message: error.flatten().fieldErrors });
            if (error.message === 'Usuário não encontrado') return res.status(404).json({ message: error.message });
            if (error.message === 'Outros usuários não podem alterar um usuário dono') return res.status(403).json({ message: error.message });
            return res.status(500).json({ error: "Erro interno" });
        }
    }

    async login(req: Request, res: Response) {
        try {
            const data = req.body;
            const userService = new UserService();
            const login = await userService.login(data);
            return res.status(200).json(login);
        } catch (error: any) {
            if (error instanceof ZodError) {
                return res.status(400).json({
                    message: error.flatten().fieldErrors,
                });
            }
            if (error.message === 'Email incorreto' || error.message === 'Senha incorreta') return res.status(401).json({ message: error.message })
            return res.status(401).json({ message: error.message || 'Erro durante o login' });
        }
    }

    async getUsers(req: Request, res: Response) {
        const userService = new UserService();
        const users = await userService.getUsers();
        return res.status(201).json(users);
    }

    async forgotPassword(req: Request, res: Response) {
        try {
            const { email } = req.body;
            const userService = new UserService();
            await userService.forgotPassword(email);
            return res.status(200).json('Se o email informado estiver cadastrado, você receberá um email com a sua nova senha');
        } catch (error: any) {
            if (error instanceof ZodError) {
                return res.status(400).json({
                    message: error.flatten().fieldErrors,
                });
            }
            return res.status(500).json({ message: 'Erro interno' });
        }
    }

}

export { UserController };