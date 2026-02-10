
import { PrismaClient } from '../../generated/prisma/client';
import { prisma } from '../index';

type ChangeDetail = {
    table: string;
    recordId: string;
    action: 'CREATE' | 'UPDATE' | 'DELETE';
    oldData?: any;
    newData?: any;
};

class AuditService {
    async logTransaction(userId: string, formId: string, actionType: string, changes: ChangeDetail[]) {
        return prisma.$transaction(async (tx) => {
            const auditLog = await tx.auditLog.create({
                data: {
                    userId,
                    formId,
                    action: actionType,
                    changes: {
                        create: changes.map(change => ({
                            table: change.table,
                            recordId: change.recordId,
                            action: change.action,
                            oldData: change.oldData ?? undefined,
                            newData: change.newData ?? undefined,
                        }))
                    }
                }
            });
            return auditLog;
        });
    }

    async revertTransaction(auditLogId: string) {
        return prisma.$transaction(async (tx) => {

            // 1. Fetch the AuditLog with all ChangeLogs
            const auditLog = await tx.auditLog.findUnique({
                where: { id: auditLogId },
                include: {
                    changes: {
                        orderBy: { id: 'asc' }
                    }
                }
            });

            if (!auditLog) {
                throw new Error("Registro de auditoria não encontrado");
            }

            // 2. Reverse the changes to undo them in LIFO order (Last In, First Out)
            const changesToRevert = [...auditLog.changes].reverse();

            for (const change of changesToRevert) {
                const model = (tx as any)[change.table]; // Dynamic model access
                if (!model) {
                    console.warn(`Model ${change.table} não encontrado no PrismaClient`);
                    continue;
                }

                if (change.action === 'CREATE') {
                    // Undo CREATE -> DELETE
                    await model.delete({
                        where: { id: change.recordId }
                    });
                } else if (change.action === 'DELETE') {
                    // Undo DELETE -> CREATE (using oldData)
                    if (change.oldData) {
                        await model.create({
                            data: change.oldData
                        });
                    }
                } else if (change.action === 'UPDATE') {
                    // Undo UPDATE -> UPDATE (set to oldData)
                    if (change.oldData) {
                        await model.update({
                            where: { id: change.recordId },
                            data: change.oldData
                        });
                    }
                }
            }

            return { success: true, originalAction: auditLog.action };
        });
    }
}

export { AuditService };
