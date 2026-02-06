import { prisma } from "..";


class FormService {
    
    async getForms() {
        const forms = await prisma.category.findMany({
            select: {
                name: true,
                categoryIcon: true,
                form: {
                    select: {
                        name: true,
                    }
                }
            }
        });
        return forms;
    }
}

export { FormService };