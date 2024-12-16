-- Triggers ou "gatilhos"
/* sintaxe 
create trigger nome timing Operação 
on tabela
for each row
declarações

timing = before | after
operação = insert | update | delete
*/

create table produto (
idProduto int not null auto_increment,
nome_Produto varchar(45) null,
preco_Normal decimal(10,2) null,
preco_desconto decimal(10,2) null,
primary key (idProduto));

create trigger pr_desconto before insert
on produto
for each row
set new.preco_Desconto = (new.preco_Normal * 0.90);
/* O NEW faz parte da sintaxe de um trigger (gatilho) no MySQL e é usado para referenciar os valores da nova linha 
que está sendo inserida ou atualizada em uma tabela. Ele é particularmente útil em triggers do tipo BEFORE ou AFTER. */

insert into produto(nome_Produto, preco_Normal)
values ('Teclado semi mecânico', 500.00);

select * from produto;
show triggers;
