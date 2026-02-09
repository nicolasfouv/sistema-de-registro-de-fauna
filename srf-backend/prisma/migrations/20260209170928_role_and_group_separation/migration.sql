/*
  Warnings:

  - You are about to drop the `autorizacao_funcao` table. If the table is not empty, all the data it contains will be lost.

*/
-- DropForeignKey
ALTER TABLE `autorizacao_funcao` DROP FOREIGN KEY `autorizacao_funcao_formId_fkey`;

-- DropForeignKey
ALTER TABLE `autorizacao_funcao` DROP FOREIGN KEY `autorizacao_funcao_roleId_fkey`;

-- DropTable
DROP TABLE `autorizacao_funcao`;

-- CreateTable
CREATE TABLE `group` (
    `id` VARCHAR(191) NOT NULL,
    `nome` VARCHAR(191) NOT NULL,

    UNIQUE INDEX `group_nome_key`(`nome`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `autorizacao_grupo` (
    `id` VARCHAR(191) NOT NULL,
    `groupId` VARCHAR(191) NOT NULL,
    `formId` VARCHAR(191) NOT NULL,
    `nivel_acesso` ENUM('read', 'edit') NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- AddForeignKey
ALTER TABLE `autorizacao_grupo` ADD CONSTRAINT `autorizacao_grupo_groupId_fkey` FOREIGN KEY (`groupId`) REFERENCES `group`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `autorizacao_grupo` ADD CONSTRAINT `autorizacao_grupo_formId_fkey` FOREIGN KEY (`formId`) REFERENCES `formulario`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;
