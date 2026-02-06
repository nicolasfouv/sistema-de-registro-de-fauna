-- AddForeignKey
ALTER TABLE `usuario` ADD CONSTRAINT `usuario_id_funcao_fkey` FOREIGN KEY (`id_funcao`) REFERENCES `funcao`(`id`) ON DELETE SET NULL ON UPDATE CASCADE;
