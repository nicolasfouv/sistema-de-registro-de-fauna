import z from "zod";
import { accessLevel } from "../../generated/prisma";

export const createUserRequest = z.object({
    name: z.string().nonempty({ error: 'Nome inválido' }),
    email: z.email({ error: 'Email inválido' }),
    password: z.string().nonempty({ error: 'Senha inválida' }),
});

const userAccessProps = z.object({
    form: z.string().nonempty({ error: 'Nome do furmulário inválido' }),
    level: z.enum(accessLevel, { error: 'Nível de acesso inválido' }),
});

export const updateUserDetailsRequest = z.object({
    userId: z.string().nonempty({ error: 'ID do usuário inválido' }),
    name: z.string().nonempty({ error: 'Nome inválido' }),
    email: z.email({ error: 'Email inválido' }),
    role: z.string().nonempty({ error: 'Função inválida' }),
});

export const updateUserPicRequest = z.object({
    userId: z.string().nonempty({ error: 'ID do usuário inválido' }),
    userPic: z.string().optional(),
});

export const updateUserAccessRequest = z.object({
    userId: z.string().nonempty({ error: 'ID do usuário inválido' }),
    userAccess: z.array(userAccessProps),
});

export const updateUserPasswordRequest = z.object({
    userId: z.string().nonempty({ error: 'ID do usuário inválido' }),
    password: z.string().nonempty({ error: 'Senha inválida' }),
});

export const loginRequest = z.object({
    email: z.email({ error: 'Email inválido' }),
    password: z.string().nonempty({ error: 'Senha inválida' }),
});