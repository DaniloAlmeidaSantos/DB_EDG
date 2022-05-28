CREATE DATABASE EDG;

USE EDG;

CREATE TABLE CLIENTES (
	ID_CLIENTE INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
	NOME VARCHAR(120) NOT NULL,
    CPF VARCHAR(14) NOT NULL,
    TELEFONE VARCHAR(11) NOT NULL,
    SEXO CHAR(2) NOT NULL,
    RG VARCHAR(12) NOT NULL,
    EMAIL VARCHAR(100) NOT NULL,
    DATA_NASC DATE NOT NULL,
    CEP VARCHAR(10) NOT NULL,
    CIDADE VARCHAR(100) NOT NULL,
    ESTADO CHAR(2) NOT NULL,
    LOGRADOURO VARCHAR(110) NOT NULL,
    BAIRRO VARCHAR(100) NOT NULL,
    NUMERO VARCHAR(10) NOT NULL,
    COMPLEMENTO VARCHAR(60),
    
    UNIQUE (CPF),
    UNIQUE (RG),
    UNIQUE (EMAIL),
    UNIQUE(TELEFONE)
);

CREATE TABLE PRODUTOS (
	ID_PRODUTO INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    NOME_PRODUTO VARCHAR(100),
    VALOR DOUBLE NOT NULL,
    KG DOUBLE,
    QUANTIDADE INT,
    VALIDADE DATE NOT NULL
);

CREATE TABLE FUNCIONARIOS (
	ID_FUNCIONARIO INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    CPF VARCHAR(14) NOT NULL,
    TELEFONE VARCHAR(11) NOT NULL,
    SEXO CHAR(2) NOT NULL,
    RG VARCHAR(12) NOT NULL,
    EMAIL VARCHAR(100) NOT NULL,
    DATA_NASC DATE NOT NULL,
    CEP INT NOT NULL,
    CIDADE VARCHAR(100) NOT NULL,
    ESTADO CHAR(2) NOT NULL,
    LOGRADOURO VARCHAR(110) NOT NULL,
    BAIRRO VARCHAR(100) NOT NULL,
    NUMERO VARCHAR(10) NOT NULL,
    COMPLEMENTO VARCHAR(60),
    CARGO VARCHAR(60) NOT NULL,
    
    UNIQUE (CPF),
    UNIQUE (RG),
    UNIQUE (EMAIL),
    UNIQUE(TELEFONE) 
);

CREATE TABLE CAIXA (
	ID INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    ID_CLIENTE INT NOT NULL,
    ID_FUNC INT,
    KG DOUBLE,
    QUANTIDADE INT,
    VALOR_TOTAL DOUBLE NOT NULL,
	DATA_VENDA DATETIME  NOT NULL DEFAULT NOW(),
    
    FOREIGN KEY (ID_CLIENTE) REFERENCES CLIENTES (ID_CLIENTE),
    FOREIGN KEY (ID_FUNC) REFERENCES FUNCIONARIOS (ID_FUNCIONARIO)
);

CREATE TABLE VENDA_PRODUTO(
	ID_VENDA_PRODUTO INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
	ID_CAIXA INT NOT NULL,
	ID_PRODUTO INT NOT NULL,
	QTDE INT,
	KG DOUBLE,
	VALOR_TOTAL DOUBLE NOT NULL,
	
	FOREIGN KEY (ID_CAIXA) REFERENCES CAIXA (ID),
	FOREIGN KEY (ID_PRODUTO) REFERENCES PRODUTOS (ID_PRODUTO)
);
CREATE TABLE NOTA_FISCAL(
	ID_NOTA_FISCAL INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
	ID_CAIXA_NF INT NOT NULL,
	ID_CLIENTE_NF INT NOT NULL,
	DATA_VENDA DATETIME NOT NULL ,
	VALOR_TOTAL DOUBLE NOT NULL,

	FOREIGN KEY (ID_CAIXA_NF) REFERENCES CAIXA(ID),
	FOREIGN KEY (ID_CLIENTE_NF) REFERENCES CLIENTES(ID_CLIENTE)
);
