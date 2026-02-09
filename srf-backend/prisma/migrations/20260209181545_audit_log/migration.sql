-- CreateTable
CREATE TABLE `auditLog` (
    `id` VARCHAR(191) NOT NULL,
    `userId` VARCHAR(191) NOT NULL,
    `date` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `auditLogDetail` (
    `id` VARCHAR(191) NOT NULL,
    `action` VARCHAR(191) NOT NULL,
    `auditLogId` VARCHAR(191) NOT NULL,
    `formId` VARCHAR(191) NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- AddForeignKey
ALTER TABLE `auditLogDetail` ADD CONSTRAINT `auditLogDetail_auditLogId_fkey` FOREIGN KEY (`auditLogId`) REFERENCES `auditLog`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `auditLogDetail` ADD CONSTRAINT `auditLogDetail_formId_fkey` FOREIGN KEY (`formId`) REFERENCES `formulario`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;
