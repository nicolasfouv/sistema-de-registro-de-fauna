/*
  Warnings:

  - You are about to drop the column `enumAccessLevelId` on the `autorizacao_grupo` table. All the data in the column will be lost.
  - You are about to drop the column `enumAccessLevelId` on the `autorizacao_usuario` table. All the data in the column will be lost.

*/
-- DropForeignKey
ALTER TABLE `autorizacao_grupo` DROP FOREIGN KEY `autorizacao_grupo_enumAccessLevelId_fkey`;

-- DropForeignKey
ALTER TABLE `autorizacao_usuario` DROP FOREIGN KEY `autorizacao_usuario_enumAccessLevelId_fkey`;

-- DropIndex
DROP INDEX `autorizacao_grupo_enumAccessLevelId_fkey` ON `autorizacao_grupo`;

-- DropIndex
DROP INDEX `autorizacao_usuario_enumAccessLevelId_fkey` ON `autorizacao_usuario`;

-- AlterTable
ALTER TABLE `autorizacao_grupo` DROP COLUMN `enumAccessLevelId`,
    MODIFY `id_nivel_acesso` VARCHAR(191) NULL;

-- AlterTable
ALTER TABLE `autorizacao_usuario` DROP COLUMN `enumAccessLevelId`,
    MODIFY `id_nivel_acesso` VARCHAR(191) NULL;

-- AddForeignKey
ALTER TABLE `autorizacao_usuario` ADD CONSTRAINT `autorizacao_usuario_id_nivel_acesso_fkey` FOREIGN KEY (`id_nivel_acesso`) REFERENCES `enum_nivel_acesso`(`id`) ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `autorizacao_grupo` ADD CONSTRAINT `autorizacao_grupo_id_nivel_acesso_fkey` FOREIGN KEY (`id_nivel_acesso`) REFERENCES `enum_nivel_acesso`(`id`) ON DELETE SET NULL ON UPDATE CASCADE;
