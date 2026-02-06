import z from "zod";
import { accessLevel } from "../../generated/prisma";

export const createUserRequest = z.object({
    name: z.string().nonempty({ error: 'Nome inválido' }),
    email: z.email({ error: 'Email inválido' }),
    password: z.string().nonempty({ error: 'Senha inválida' }),
    role: z.string().optional(),
});

const userAccessProps = z.object({
    form: z.string().nonempty({ error: 'Nome do furmulário inválido' }),
    level: z.enum(accessLevel, { error: 'Nível de acesso inválido' }),
});

export const updateUserRequest = z.object({
    userId: z.string().nonempty({ error: 'ID do usuário inválido' }),
    name: z.string().optional(),
    email: z.email({ error: 'Email inválido' }).optional(),
    password: z.string().optional(),
    userPic: z.string().optional(),
    role: z.string().optional().nullable(),
    userAccess: z.array(userAccessProps).optional(),
});

export const loginRequest = z.object({
    email: z.email({ error: 'Email inválido' }),
    password: z.string().nonempty({ error: 'Senha inválida' }),
});