# Triggers
/* 	
   Triggers (ou gatilhos, em português) são objetos de banco de dados que executam um conjunto de comandos automaticamente em 
resposta a eventos específicos que ocorrem em uma tabela.
 */


CREATE TABLE IF NOT EXISTS auditoria_pedidos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    tipo_operacao VARCHAR(10),
    id_pedido INT,
    data_registro DATETIME
);

-- Criação do trigger de auditoria para inserções
DELIMITER //
create trigger auditoria_pedidos_insert
after insert
on auditoria_pedidos
for each row
begin 
	insert into auditoria_pedidos(tipo_operacao, id_pedido, data_registro)
    values ('Inserção', new.id_pedido, now());
end //
DELIMITER ;


