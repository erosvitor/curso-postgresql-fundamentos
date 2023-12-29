
CREATE DATABASE vendas;

\connect vendas;

CREATE SEQUENCE categoria_produtos_seq;
CREATE TABLE categoria_produtos
(
  codigo INTEGER NOT NULL DEFAULT NEXTVAL('categoria_produtos_seq'),
  nome VARCHAR(40) NOT NULL,
  PRIMARY KEY (codigo)
);
ALTER SEQUENCE categoria_produtos_seq OWNED BY categoria_produtos.codigo;

CREATE SEQUENCE produtos_seq;
CREATE TABLE produtos
(
  codigo INTEGER NOT NULL DEFAULT NEXTVAL('produtos_seq'),
  nome VARCHAR(100) NOT NULL,
  preco DECIMAL(10,2) NOT NULL,
  codigo_categoria INTEGER NOT NULL,
  PRIMARY KEY (codigo),
  FOREIGN KEY (codigo_categoria) REFERENCES categoria_produtos(codigo)
);
ALTER SEQUENCE produtos_seq OWNED BY produtos.codigo;

CREATE SEQUENCE clientes_seq;
CREATE TABLE clientes
(
  codigo INTEGER NOT NULL DEFAULT NEXTVAL('clientes_seq'),
  nome VARCHAR(60) NOT NULL,
  uf CHAR(2) NOT NULL,
  genero CHAR(10) NOT NULL,
  PRIMARY KEY(codigo)
);
ALTER SEQUENCE clientes_seq OWNED BY clientes.codigo;

CREATE SEQUENCE vendas_seq;
CREATE TABLE vendas
(
  codigo INTEGER NOT NULL DEFAULT NEXTVAL('vendas_seq'),
  data_venda TIMESTAMP NOT NULL,
  codigo_cliente INTEGER NOT NULL,
  PRIMARY KEY (codigo),
  FOREIGN KEY (codigo_cliente) REFERENCES clientes(codigo)
);
ALTER SEQUENCE vendas_seq OWNED BY vendas.codigo;

CREATE SEQUENCE vendas_itens_seq;
CREATE TABLE vendas_itens
(
  codigo INTEGER NOT NULL DEFAULT NEXTVAL('vendas_itens_seq'),
  codigo_venda INTEGER NOT NULL,
  codigo_produto INTEGER NOT NULL,
  quantidade SMALLINT NOT NULL,
  preco DECIMAL(10,2) NOT NULL,
  PRIMARY KEY (codigo),
  FOREIGN KEY (codigo_venda) REFERENCES vendas(codigo),
  FOREIGN KEY (codigo_produto) REFERENCES produtos(codigo)
);
ALTER SEQUENCE vendas_itens_seq OWNED BY vendas_itens.codigo;

