/* Exercício 01 - Com base na matricula, calcula o 
total de vendas de um vendedor.*/
DELIMITER  //
create function calculo_venda(matricula varchar(5))
returns decimal(10,2)
deterministic
begin
	declare total_vendas decimal(10,2);
	select sum(inf.PRECO * inf.QUANTIDADE) into total_vendas
    from itens_notas_fiscais inf
    inner join notas_fiscais nf on nf.NUMERO = inf.NUMERO
	where nf.MATRICULA = matricula;
    return total_vendas;
end //
DELIMITER ;

select calculo_venda('00236') as 'Total em vendas';

-- ---------------------------------------------------------------------------------

/* Exercício 02 - Com base na matricula, calcula o 
tempo de serviço de um vendedor.*/
DELIMITER //
create function tempo_servico_vendedor(matricula varchar(5))
returns int
deterministic
begin
	declare tempo_srvc int;
    select timestampdiff(year, tv.DATA_ADMISSAO, curdate())
    into tempo_srvc
    from tabela_de_vendedores tv
    where tv.MATRICULA = matricula;
    return tempo_srvc;
end //
DELIMITER ;

select tempo_servico_vendedor('00237') as 'Tempo de serviço';

-- ---------------------------------------------------------------------------------

/* Exercício 03 - Com base no código do produto 
calcula o total de vendas de um produto.*/
DELIMITER //
create function total_vendas_produto(id_produto int)
returns decimal(10,2)
deterministic
begin
	declare precoTotalProduto decimal(10,2);
    select sum(inf.PRECO * inf.QUANTIDADE)
    into precoTotalProduto
    from itens_notas_fiscais inf
    inner join tabela_de_produtos tbp using(CODIGO_DO_PRODUTO)
    where tbp.CODIGO_DO_PRODUTO = id_produto;
    return precoTotalProduto;
end //
DELIMITER ;

select*from tabela_de_produtos;
select total_vendas_produto(1013793);
