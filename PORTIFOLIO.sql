CREATE DATABASE LOJA;
CREATE TABLE Contas_a_Receber(
id INT PRIMARY KEY NOT NULL,
cliente_id INT FOREIGN KEY (cliente_id) reference cliente (cliente_id),
fatura_de_venda_id INT,
data_da_compra DATE NOT NULL,
data_do_vencimento DATE NOT NULL,
valor DECIMAL(18,2) NOT NULL,
situacao ENUM('1', '2', '3') NOT NULL
);
CREATE TABLE CLIENTE(
id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
nome VARCHAR(80) NOT NULL,
cpf CHAR(11) NOT NULL,
celular CHAR(11) NOT NULL,
endcontas_a_receber_logadouro VARCHAR(100),
end_numero VARCHAR(10) NOT NULL,
end_municipio INT NOT NULL,
end_cep CHAR(8) NOT NULL,
municipio_id INT FOREIGN KEY (municipio_id) reference municipio (municipio_id) NOT NULL
);
CREATE TABLE municipio(
id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
estado_id INT NOT NULL FOREIGN KEY (estado_id) reference estado (estado_id),
nome VARCHAR(80) NOT NULL,
cod_ibge INT
);
CREATE TABLE ESTADO(
id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
nome VARCHAR(50) NOT NULL,
uf CHAR(2)
);

# Etapa 2  

INSERT INTO `loja`.`estado`(`Nome`,`UF`)VALUES('SAO PAULO','SP');

INSERT INTO

`loja`.`municipio`(`Estado_ID`,`Nome`,`CodIGBE`)VALUES(1,'SÃO PAULO',555);

INSERT INTO

`loja`.`cliente`(`Nome`,`CPF`,`Celular`,`EndLogradouro`,`EndNumero`,`EndMunici

pio`,`EndCEP`,`Municipio_ID`)VALUES('JOÃO', 12345676891,

11999998888,'AVENIDA PAULISTA', 1500, 1, 11110000, 1);

INSERT INTO

`loja`.`contareceber`(`Cliente_ID`,`FaturaVendaID`,`DataConta`,`DataVencimento

`,`Valor`,`Situacao`)VALUES(1,1,'2022-09-15','2022-10-15',199.99,1);

# Etapa 3

SELECT `contareceber`.`ID`,

   `cliente`.`Nome`,

   `cliente`.`CPF`,

   `contareceber`.`DataVencimento`,

   `contareceber`.`Valor`

FROM `loja`.`contareceber`

INNER JOIN  

   `loja`.`cliente` ON `contareceber`.`ID` = `cliente`.`ID`

WHERE

   `contareceber`.`Situacao` = 1;