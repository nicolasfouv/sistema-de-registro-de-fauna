-- AlterTable
ALTER TABLE `autorizacao_grupo` MODIFY `nivel_acesso` ENUM('read', 'edit', 'edit_unrestricted') NOT NULL;

-- AlterTable
ALTER TABLE `autorizacao_usuario` MODIFY `nivel_acesso` ENUM('read', 'edit', 'edit_unrestricted') NOT NULL;
