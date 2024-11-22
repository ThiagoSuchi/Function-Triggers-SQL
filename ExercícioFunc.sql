# Exercício 01 - Crie uma function em SQL que calcule automaticamente o faturamento de uma venda.
# Essa function deve receber dois parâmetros:
# preço (tipo DECIMAL)
# quantidade (tipo INT)
# A função deve retornar o faturamento (um valor decimal), que será o resultado da multiplicação entre esses dois valores.

DELIMITER $$
create function calculo_receita(preco decimal(10,2), quantidade int)
returns decimal(10,2)
deterministic
begin
	return preco * quantidade;
end $$
DELIMITER ;

select calculo_receita(25.99, 3)as Faturamento;





