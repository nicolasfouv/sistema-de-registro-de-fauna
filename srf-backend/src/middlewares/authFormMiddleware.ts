import 'dotenv/config';
import { NextFunction, Request, Response } from "express";
import { accessLevel } from "../../generated/prisma";
import { verify } from "jsonwebtoken";
import { prisma } from '..';

interface Payload {
    sub: string,
}

export function authFormMiddleware(formName: string, requiredLevel?: accessLevel) {

    return async (req: Request, res: Response, next: NextFunction) => {
        const authHeader = req.headers.authorization;
        if (!authHeader || !authHeader.startsWith('Bearer ')) return res.status(401).json({ message: 'Token não fornecido' });

        const [, token] = authHeader.split(' ');
        try {
            const decoded = verify(token as string, process.env.JWT_SECRET as string) as Payload;
            const user_id = decoded.sub;
            req.userId = user_id;

            const user = await prisma.user.findUnique({
                where: { id: user_id }, select: { role: { select: { name: true } } }
            })

            const form = await prisma.form.findUnique({
                where: { name: formName }
            })
            if (!form) return res.status(404).json({ message: 'Formulário não encontrado' });

            if (user?.role?.name === 'admin' || user?.role?.name === 'owner') return next();

            if (requiredLevel) {
                const levelOrder: Record<accessLevel, number> = {
                    [accessLevel.read]: 0,
                    [accessLevel.edit]: 1,
                }
                const userAccess = await prisma.userAccess.findFirst({
                    where: { userId: user_id, formId: form.id }
                })
                if (!userAccess) return res.status(403).json({ message: 'Acesso negado' });
                const userLevel = levelOrder[userAccess.accessLevel];
                const needsLevel = levelOrder[requiredLevel];
                if (userLevel < needsLevel) return res.status(403).json({ message: 'Acesso negado' });
            }
            return next();

        } catch (error) {
            return res.status(401).json({ message: 'Token inválido' });
        }
    }

}