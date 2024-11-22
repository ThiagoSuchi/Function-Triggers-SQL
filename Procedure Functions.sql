# Functions 

-- Sintaxe
DELIMITER $$
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
