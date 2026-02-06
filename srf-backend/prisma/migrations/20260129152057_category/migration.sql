/*
  Warnings:

  - Added the required column `categoryId` to the `formulario` table without a default value. This is not possible if the table is not empty.

*/
-- AlterTable
ALTER TABLE `formulario` ADD COLUMN `categoryId` VARCHAR(191) NOT NULL;

-- CreateTable
CREATE TABLE `categoria` (
    `id` VARCHAR(191) NOT NULL,
    `nome` VARCHAR(191) NOT NULL,

    UNIQUE INDEX `categoria_nome_key`(`nome`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- AddForeignKey
ALTER TABLE `formulario` ADD CONSTRAINT `formulario_categoryId_fkey` FOREIGN KEY (`categoryId`) REFERENCES `categoria`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;
