/*
  Warnings:

  - You are about to drop the column `userId` on the `auditlog` table. All the data in the column will be lost.
  - You are about to drop the column `formId` on the `autorizacao_grupo` table. All the data in the column will be lost.
  - You are about to drop the column `groupId` on the `autorizacao_grupo` table. All the data in the column will be lost.
  - You are about to drop the column `formId` on the `autorizacao_usuario` table. All the data in the column will be lost.
  - You are about to drop the column `userId` on the `autorizacao_usuario` table. All the data in the column will be lost.
  - You are about to drop the column `categoryIcon` on the `categoria` table. All the data in the column will be lost.
  - You are about to drop the column `categoryId` on the `formulario` table. All the data in the column will be lost.
  - You are about to drop the `auditlogdetail` table. If the table is not empty, all the data it contains will be lost.
  - Added the required column `acao` to the `auditLog` table without a default value. This is not possible if the table is not empty.
  - Added the required column `formId` to the `auditLog` table without a default value. This is not possible if the table is not empty.
  - Added the required column `id_usuario` to the `auditLog` table without a default value. This is not possible if the table is not empty.
  - Added the required column `id_formulario` to the `autorizacao_grupo` table without a default value. This is not possible if the table is not empty.
  - Added the required column `id_grupo` to the `autorizacao_grupo` table without a default value. This is not possible if the table is not empty.
  - Added the required column `id_formulario` to the `autorizacao_usuario` table without a default value. This is not possible if the table is not empty.
  - Added the required column `id_usuario` to the `autorizacao_usuario` table without a default value. This is not possible if the table is not empty.
  - Added the required column `id_sub_categoria` to the `formulario` table without a default value. This is not possible if the table is not empty.

*/
-- DropForeignKey
ALTER TABLE `auditlogdetail` DROP FOREIGN KEY `auditLogDetail_auditLogId_fkey`;

-- DropForeignKey
ALTER TABLE `auditlogdetail` DROP FOREIGN KEY `auditLogDetail_formId_fkey`;

-- DropForeignKey
ALTER TABLE `autorizacao_grupo` DROP FOREIGN KEY `autorizacao_grupo_formId_fkey`;

-- DropForeignKey
ALTER TABLE `autorizacao_grupo` DROP FOREIGN KEY `autorizacao_grupo_groupId_fkey`;

-- DropForeignKey
ALTER TABLE `autorizacao_usuario` DROP FOREIGN KEY `autorizacao_usuario_formId_fkey`;

-- DropForeignKey
ALTER TABLE `autorizacao_usuario` DROP FOREIGN KEY `autorizacao_usuario_userId_fkey`;

-- DropForeignKey
ALTER TABLE `formulario` DROP FOREIGN KEY `formulario_categoryId_fkey`;

-- DropIndex
DROP INDEX `autorizacao_grupo_formId_fkey` ON `autorizacao_grupo`;

-- DropIndex
DROP INDEX `autorizacao_grupo_groupId_fkey` ON `autorizacao_grupo`;

-- DropIndex
DROP INDEX `autorizacao_usuario_formId_fkey` ON `autorizacao_usuario`;

-- DropIndex
DROP INDEX `autorizacao_usuario_userId_fkey` ON `autorizacao_usuario`;

-- DropIndex
DROP INDEX `formulario_categoryId_fkey` ON `formulario`;

-- AlterTable
ALTER TABLE `auditlog` DROP COLUMN `userId`,
    ADD COLUMN `acao` VARCHAR(191) NOT NULL,
    ADD COLUMN `formId` VARCHAR(191) NOT NULL,
    ADD COLUMN `id_usuario` VARCHAR(191) NOT NULL;

-- AlterTable
ALTER TABLE `autorizacao_grupo` DROP COLUMN `formId`,
    DROP COLUMN `groupId`,
    ADD COLUMN `id_formulario` VARCHAR(191) NOT NULL,
    ADD COLUMN `id_grupo` VARCHAR(191) NOT NULL;

-- AlterTable
ALTER TABLE `autorizacao_usuario` DROP COLUMN `formId`,
    DROP COLUMN `userId`,
    ADD COLUMN `id_formulario` VARCHAR(191) NOT NULL,
    ADD COLUMN `id_usuario` VARCHAR(191) NOT NULL;

-- AlterTable
ALTER TABLE `categoria` DROP COLUMN `categoryIcon`,
    ADD COLUMN `icone_categoria` VARCHAR(191) NULL;

-- AlterTable
ALTER TABLE `formulario` DROP COLUMN `categoryId`,
    ADD COLUMN `id_sub_categoria` VARCHAR(191) NOT NULL;

-- DropTable
DROP TABLE `auditlogdetail`;

-- CreateTable
CREATE TABLE `sub_categoria` (
    `id` VARCHAR(191) NOT NULL,
    `nome` VARCHAR(191) NOT NULL,
    `id_categoria` VARCHAR(191) NOT NULL,

    UNIQUE INDEX `sub_categoria_nome_key`(`nome`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- AddForeignKey
ALTER TABLE `sub_categoria` ADD CONSTRAINT `sub_categoria_id_categoria_fkey` FOREIGN KEY (`id_categoria`) REFERENCES `categoria`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `formulario` ADD CONSTRAINT `formulario_id_sub_categoria_fkey` FOREIGN KEY (`id_sub_categoria`) REFERENCES `sub_categoria`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `autorizacao_usuario` ADD CONSTRAINT `autorizacao_usuario_id_usuario_fkey` FOREIGN KEY (`id_usuario`) REFERENCES `usuario`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `autorizacao_usuario` ADD CONSTRAINT `autorizacao_usuario_id_formulario_fkey` FOREIGN KEY (`id_formulario`) REFERENCES `formulario`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `autorizacao_grupo` ADD CONSTRAINT `autorizacao_grupo_id_grupo_fkey` FOREIGN KEY (`id_grupo`) REFERENCES `grupo`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `autorizacao_grupo` ADD CONSTRAINT `autorizacao_grupo_id_formulario_fkey` FOREIGN KEY (`id_formulario`) REFERENCES `formulario`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `auditLog` ADD CONSTRAINT `auditLog_formId_fkey` FOREIGN KEY (`formId`) REFERENCES `formulario`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;
