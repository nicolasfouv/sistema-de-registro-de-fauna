import z from 'zod';

// Inputs
export const createVeterinarianVisitInputSchema = z.object({
    liveAnimalId: z.number().int().positive({ error: 'ID do animal inválido' }),
    veterinarianId: z.number().int().positive({ error: 'ID do veterinário inválido' }),
    date: z.string().nonempty({ error: 'Data inválida' }),
    animalPicture: z.string().optional(),
    note: z.string().optional(),
    bodyMeasurements: z.array(z.object({
        bodyMeasurementTypeId: z.number().int().positive({ error: 'ID do tipo de medida corporal inválido' }),
        value: z.number().positive({ error: 'Valor inválido' }),
    })).optional(),
});

export const updateVeterinarianVisitInputSchema = createVeterinarianVisitInputSchema;

// Outputs
export const getAllVeterinarianVisitOutputSchema = z.object({
    id: z.number().int(),
    canEdit: z.boolean(),
    createdByMe: z.boolean(),
    hasSample: z.boolean(),
    hasPhysicalExam: z.boolean(),
    hasVaccine: z.boolean(),
    hasExamResult: z.boolean(),
    hasSorologyAnalysis: z.boolean(),
    hasEctoparasiteAnalysis: z.boolean(),
    hasStoolAnalysis: z.boolean(),
    hasCastration: z.boolean(),
    liveAnimalId: z.number().int(),
    liveAnimalCode: z.string().nonempty(),
    veterinarianId: z.number().int(),
    veterinarianName: z.string().nonempty(),
    date: z.string().nonempty(),
    dateFormatted: z.string().optional(),
    animalPicture: z.string().optional(),
    note: z.string().optional(),
    bodyMeasurements: z.array(z.object({
        id: z.number().int(),
        bodyMeasurementTypeId: z.number().int(),
        bodyMeasurementTypeDescription: z.string().nonempty(),
        bodyMeasurementTypeUnit: z.string().nonempty(),
        value: z.number(),
    })),
});

export const getFormOptionsVeterinarianVisitOutputSchema = z.object({
    liveAnimals: z.array(z.object({
        id: z.number().int(),
        code: z.string().nonempty(),
    })),
    veterinarians: z.array(z.object({
        id: z.number().int(),
        name: z.string().nonempty(),
    })),
    bodyMeasurementTypes: z.array(z.object({
        id: z.number().int(),
        description: z.string().nonempty(),
        unit: z.string().nonempty(),
    })),
});

// Types – Inputs
export type CreateVeterinarianVisitInput = z.infer<typeof createVeterinarianVisitInputSchema>;
export type UpdateVeterinarianVisitInput = z.infer<typeof updateVeterinarianVisitInputSchema>;

// Types – Outputs
export type GetAllVeterinarianVisitOutput = z.infer<typeof getAllVeterinarianVisitOutputSchema>;
export type GetFormOptionsVeterinarianVisitOutput = z.infer<typeof getFormOptionsVeterinarianVisitOutputSchema>;
