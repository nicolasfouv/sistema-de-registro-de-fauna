
import { prisma } from '../src/index';
import { AuditService } from '../src/services/AuditService';

async function main() {
    console.log("Starting verification...");

    // 1. Find a user and form to associate with the log
    // If not found, creating dummy ones might be needed, but let's try finding first.
    let user = await prisma.user.findFirst();
    let form = await prisma.form.findFirst();

    if (!user) {
        console.log("No user found, creating a dummy user...");
        // Depending on schema, might need role/etc. 
        // check schema: user -> roleId default "2"
        // User needs name, email, password.
        // create role first if needed? `roleId` is string uuid. 
        // If DB is empty, migration seeded nothing?
        // `system-body.sql` had inserts. Database should have data.
        // But I removed the data section in schema? No, the SQL dump had data.
        // If I just migrated, existing data (from SQL dump if applied) might be there.
        // But `migrate dev` applies migration over existing DB. 
        // If DB was empty (from `prisma migrate reset` if drift), data is gone.
        // I'll assume data might be gone if migration required reset.
        // I'll create everything needed.

        const role = await prisma.role.create({ data: { name: 'TestRole' } });
        user = await prisma.user.create({
            data: {
                name: 'Test User',
                email: `test${Date.now()}@example.com`,
                password: 'pass',
                roleId: role.id
            }
        });
    }

    if (!form) {
        console.log("No form found, creating a dummy form...");
        const category = await prisma.category.create({
            data: { name: `Cat${Date.now()}` }
        });
        const subCategory = await prisma.subCategory.create({
            data: { name: `SubCat${Date.now()}`, categoryId: category.id }
        });
        form = await prisma.form.create({
            data: { name: `Form${Date.now()}`, subCategoryId: subCategory.id }
        });
    }

    console.log(`Using User: ${user.id}, Form: ${form.id}`);

    // 2. Create a dummy entity to test revert (e.g. another Category)
    // We use Category because it's simple.
    const testCategoryName = `RevertTest ${Date.now()}`;
    const testCategory = await prisma.category.create({
        data: {
            name: testCategoryName,
            categoryIcon: 'test-icon'
        }
    });
    console.log(`Created Test Category: ${testCategory.id}`);

    // 3. Log the creation transaction
    const service = new AuditService();
    const log = await service.logTransaction(user.id, form.id, 'TEST_CREATE', [{
        table: 'category',
        recordId: testCategory.id,
        action: 'CREATE',
        newData: testCategory // store the created data so we know what was created (though creating log assumes we know)
        // For CREATE, oldData is null/undefined.
    }]);
    console.log(`Logged Transaction: ${log.id}`);

    // 4. Verify category exists
    const check1 = await prisma.category.findUnique({ where: { id: testCategory.id } });
    if (!check1) {
        throw new Error("Category should exist before revert!");
    }
    console.log("Category confirmed to exist.");

    // 5. Revert
    console.log("Reverting transaction...");
    await service.revertTransaction(log.id);

    // 6. Verify category is gone
    const check2 = await prisma.category.findUnique({ where: { id: testCategory.id } });
    if (check2) {
        throw new Error("Category was NOT deleted by revert!");
    }
    console.log("Category deleted successfully via revert! Test Passed.");
}

main()
    .catch(e => {
        console.error("Test Failed:", e);
        process.exit(1);
    })
    .finally(async () => {
        await prisma.$disconnect();
    });
