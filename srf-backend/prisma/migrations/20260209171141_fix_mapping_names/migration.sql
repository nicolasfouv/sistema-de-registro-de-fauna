/*
  Warnings:

  - You are about to drop the `applicant` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `group` table. If the table is not empty, all the data it contains will be lost.

*/
-- DropForeignKey
ALTER TABLE `autorizacao_grupo` DROP FOREIGN KEY `autorizacao_grupo_groupId_fkey`;

-- DropIndex
DROP INDEX `autorizacao_grupo_groupId_fkey` ON `autorizacao_grupo`;

-- DropTable
DROP TABLE `applicant`;

-- DropTable
DROP TABLE `group`;

-- CreateTable
CREATE TABLE `solicitante` (
    `id` VARCHAR(191) NOT NULL,
    `nome` VARCHAR(191) NOT NULL,
    `email` VARCHAR(191) NOT NULL,
    `senha` VARCHAR(191) NOT NULL,
    `mensagem` VARCHAR(191) NULL,

    UNIQUE INDEX `solicitante_email_key`(`email`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `grupo` (
    `id` VARCHAR(191) NOT NULL,
    `nome` VARCHAR(191) NOT NULL,

    UNIQUE INDEX `grupo_nome_key`(`nome`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- AddForeignKey
ALTER TABLE `autorizacao_grupo` ADD CONSTRAINT `autorizacao_grupo_groupId_fkey` FOREIGN KEY (`groupId`) REFERENCES `grupo`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;
