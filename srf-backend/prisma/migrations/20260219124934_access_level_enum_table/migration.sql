/*
  Warnings:

  - You are about to drop the column `nivel_acesso` on the `autorizacao_grupo` table. All the data in the column will be lost.
  - You are about to drop the column `nivel_acesso` on the `autorizacao_usuario` table. All the data in the column will be lost.
  - Added the required column `id_nivel_acesso` to the `autorizacao_grupo` table without a default value. This is not possible if the table is not empty.
  - Added the required column `id_nivel_acesso` to the `autorizacao_usuario` table without a default value. This is not possible if the table is not empty.

*/
-- AlterTable
ALTER TABLE `autorizacao_grupo` DROP COLUMN `nivel_acesso`,
    ADD COLUMN `enumAccessLevelId` VARCHAR(191) NULL,
    ADD COLUMN `id_nivel_acesso` VARCHAR(191) NOT NULL;

-- AlterTable
ALTER TABLE `autorizacao_usuario` DROP COLUMN `nivel_acesso`,
    ADD COLUMN `enumAccessLevelId` VARCHAR(191) NULL,
    ADD COLUMN `id_nivel_acesso` VARCHAR(191) NOT NULL;

-- CreateTable
CREATE TABLE `enum_nivel_acesso` (
    `id` VARCHAR(191) NOT NULL,
    `valor` INTEGER NOT NULL,
    `nome` VARCHAR(191) NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- AddForeignKey
ALTER TABLE `autorizacao_usuario` ADD CONSTRAINT `autorizacao_usuario_enumAccessLevelId_fkey` FOREIGN KEY (`enumAccessLevelId`) REFERENCES `enum_nivel_acesso`(`id`) ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `autorizacao_grupo` ADD CONSTRAINT `autorizacao_grupo_enumAccessLevelId_fkey` FOREIGN KEY (`enumAccessLevelId`) REFERENCES `enum_nivel_acesso`(`id`) ON DELETE SET NULL ON UPDATE CASCADE;
