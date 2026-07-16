import z from 'zod';

// Inputs
export const createApplicantInputSchema = z.object({
    name: z.string().nonempty({ error: 'Nome inválido' }),
    email: z.string().nonempty({ error: 'Email inválido' }),
    password: z.string().nonempty({ error: 'Senha inválida' }),
    message: z.string().optional(),
});

// Outputs
export const getAllApplicantOutputSchema = z.object({
    id: z.string().nonempty(),
    name: z.string().nonempty(),
    email: z.string().nonempty(),
    date: z.string().nonempty(),
    message: z.string().optional(),
});

// Types – Inputs
export type CreateApplicantInput = z.infer<typeof createApplicantInputSchema>;

// Types – Outputs
export type GetAllApplicantOutput = z.infer<typeof getAllApplicantOutputSchema>;
