import z from "zod";
import { accessLevel } from "../../generated/prisma";

export const formRequest = z.object({
    formName: z.string().nonempty({error: 'Nome do formulário inválido'}),
    requiredLevel: z.enum(accessLevel, {error: 'Nível de acesso inválido'}).optional(),
});