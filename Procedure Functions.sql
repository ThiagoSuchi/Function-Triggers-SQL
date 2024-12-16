# Functions 

-- Sintaxe
/* DELIMITER $$
create function exe_name(param1 int,param2 decimal(10,2),parame3 varchar(50))
returns int
deterministic
begin
	codigo1;
    codigo2;
    codigo3;
    return expressao
end $$
DELIMITER ;

select exe_name(valor1, valor2, valor3);
*/

-- Function com bloco if/else/elseif 
DELIMITER //
create function calcula_imposto(salario dec(8,2))
returns dec(8,2)
deterministic
begin 
	declare imposto dec(8,2);
    if salario < 1000.00 then
		set imposto = 0.00;
	elseif salario < 2000.00 then 
		set imposto = salario * 0.15;
	elseif salario < 3000.00 then
		set imposto = salario * 0.22;
	else
		set imposto = salario * 0.27;
	end if;
    return imposto;
end //
DELIMITER ;

select calcula_imposto(1500.20) as 'Valor do imposto a ser pago:';

-- Function com bloco case
DELIMITER //
create function calcula_imposto_case(salario dec(8,2))
returns dec(8,2)
deterministic
begin
	declare imposto dec(8,2);
    case
	when salario < 1000.00 then
		set imposto = 0.00;
	when salario < 2000.00 then
		set imposto = salario * 0.15;
	when salario < 3000.00 then
		set imposto = salario * 0.22;
	else
		set imposto = salario * 0.27;
	end case;
    return imposto;
end //
DELIMITER ; 

select calcula_imposto_case(6000);