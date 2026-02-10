/*
  Warnings:

  - You are about to drop the column `formId` on the `auditlog` table. All the data in the column will be lost.
  - Added the required column `id_formulario` to the `auditlog` table without a default value. This is not possible if the table is not empty.

*/
-- DropForeignKey
ALTER TABLE `auditlog` DROP FOREIGN KEY `auditLog_formId_fkey`;

-- DropIndex
DROP INDEX `auditLog_formId_fkey` ON `auditlog`;

-- AlterTable
ALTER TABLE `auditlog` DROP COLUMN `formId`,
    ADD COLUMN `id_formulario` VARCHAR(191) NOT NULL;

-- CreateTable
CREATE TABLE `changelog` (
    `id` VARCHAR(191) NOT NULL,
    `id_auditlog` VARCHAR(191) NOT NULL,
    `tabela` VARCHAR(191) NOT NULL,
    `id_registro` VARCHAR(191) NOT NULL,
    `tipo_acao` VARCHAR(191) NOT NULL,
    `dados_antigos` JSON NULL,
    `dados_novos` JSON NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- AddForeignKey
ALTER TABLE `auditlog` ADD CONSTRAINT `auditlog_id_usuario_fkey` FOREIGN KEY (`id_usuario`) REFERENCES `usuario`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `auditlog` ADD CONSTRAINT `auditlog_id_formulario_fkey` FOREIGN KEY (`id_formulario`) REFERENCES `formulario`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `changelog` ADD CONSTRAINT `changelog_id_auditlog_fkey` FOREIGN KEY (`id_auditlog`) REFERENCES `auditlog`(`id`) ON DELETE CASCADE ON UPDATE CASCADE;
