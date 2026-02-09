import { prisma } from "..";


class FormService {

    async getOptions() {
        const options = await prisma.category.findMany({
            select: {
                name: true,
                categoryIcon: true,
                subCategory: {
                    select: {
                        name: true,
                    }
                }
            }
        });
        return options;
    }
}

export { FormService };