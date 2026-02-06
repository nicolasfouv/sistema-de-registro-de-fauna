/*
  Warnings:

  - Made the column `id_funcao` on table `usuario` required. This step will fail if there are existing NULL values in that column.

*/
-- DropForeignKey
ALTER TABLE `usuario` DROP FOREIGN KEY `usuario_id_funcao_fkey`;

-- DropIndex
DROP INDEX `usuario_id_funcao_fkey` ON `usuario`;

-- AlterTable
ALTER TABLE `usuario` MODIFY `id_funcao` VARCHAR(191) NOT NULL DEFAULT '2';

-- AddForeignKey
ALTER TABLE `usuario` ADD CONSTRAINT `usuario_id_funcao_fkey` FOREIGN KEY (`id_funcao`) REFERENCES `funcao`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;
