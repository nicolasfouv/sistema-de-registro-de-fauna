import { prisma } from "..";


export class GroupService {
    async getAllGroups() {
        const groups = await prisma.group.findMany({
            select: {
                id: true,
                name: true,
            }
        });
        return groups;
    }
}