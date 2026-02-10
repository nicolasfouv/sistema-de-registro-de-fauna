/*
  Warnings:

  - You are about to drop the column `date` on the `solicitante` table. All the data in the column will be lost.

*/
-- AlterTable
ALTER TABLE `solicitante` DROP COLUMN `date`,
    ADD COLUMN `data` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3);
