import 'dotenv';
import { NextFunction, Request, Response } from "express";
import { verify } from "jsonwebtoken";
import { prisma } from "..";
import { accessLevel } from "../../generated/prisma";
import { formRequest } from '../models/formModel';

interface Payload {
    sub: string,
}

export function authMiddleware(permission?: 'admin', formData?: any) {

    return async (req: Request, res: Response, next: NextFunction) => {
        const authHeader = req.headers.authorization;
        if(!authHeader || !authHeader.startsWith('Bearer ')) return res.status(401).json({message: 'Token não fornecido'});

        const [, token] = authHeader.split(' ');
        try {
            const decoded = verify(token as string, process.env.JWT_SECRET as string) as Payload;
            const user_id = decoded.sub;
            req.userId = user_id;

            if(formData) {
                console.log('form auth')
                const {formName, requiredLevel} = formRequest.parse(formData);
                const user = await prisma.user.findUnique({
                    where: { id: user_id },
                    include: {
                        // quais formulários e qual o nivel de acesso para aquele formulario o usuario possui
                        userAccess: { select: { accessLevel: true, form: { select: { name: true } } } }, 
                        // quais formulários, qual o nivel de acesso para aquele formulario a função possui e o nome da função
                        role: { select: { name: true, roleAccess: { select: { accessLevel: true, form: { select: { name: true } } } } } },
                    }
                });

                const isAdmin = user?.role?.name === 'admin' || user?.role?.name === 'owner';
                if(isAdmin) return next();

                const permissionsMap = new Map<string, string>();
                user?.role?.roleAccess.forEach(access => {
                    permissionsMap.set(access.form.name, access.accessLevel);
                });
                user?.userAccess.forEach(access => {
                    permissionsMap.set(access.form.name, access.accessLevel);
                });

                const hasForm = permissionsMap.get(formName);
                if(!hasForm) return res.status(403).json({message: 'Acesso negado'});

                if(requiredLevel) {
                    const levelOrder: Record<accessLevel, number> = {
                        [accessLevel.read]: 0,
                        [accessLevel.edit]: 1,
                    }
                    const userLevel = levelOrder[hasForm as accessLevel];
                    const needsLevel = levelOrder[requiredLevel];
                    if(userLevel < needsLevel) return res.status(403).json({message: 'Acesso negado'});
                }
            }

            if(permission) {
                console.log("admin auth")
                const user = await prisma.user.findUnique({
                    where: { id: user_id }, select: {role: { select: {name: true} } }
                });
                if(user?.role?.name !== 'admin' && user?.role?.name !== 'owner') return res.status(403).json({message: 'Acesso negado'});
                return next();
            }

            return next();
        } catch (error) {
            return res.status(401).json({message: 'Token inválido'});
        }
    }

}