
CREATE DATABASE atlas;

\connect atlas; 

BEGIN;
CREATE SEQUENCE continentes_seq;
CREATE TABLE continentes
(
  codigo SMALLINT NOT NULL DEFAULT NEXTVAL('continentes_seq'),
  nome VARCHAR(20) NOT NULL,
  PRIMARY KEY (codigo)
);
ALTER SEQUENCE continentes_seq OWNED BY continentes.codigo;

CREATE SEQUENCE paises_seq;
CREATE TABLE paises
(
  codigo SMALLINT NOT NULL DEFAULT NEXTVAL('paises_seq'),
  codigo_continente SMALLINT NOT NULL,
  nome VARCHAR(40) NOT NULL,
  capital VARCHAR(40),
  area INTEGER,
  ddi SMALLINT,
  PRIMARY KEY (codigo),
  FOREIGN KEY (codigo_continente) REFERENCES continentes(codigo)
);
ALTER SEQUENCE paises_seq OWNED BY paises.codigo;

CREATE SEQUENCE regioes_seq;
CREATE TABLE regioes
(
  codigo SMALLINT NOT NULL DEFAULT NEXTVAL('regioes_seq'),
  codigo_pais SMALLINT NOT NULL,
  nome VARCHAR(15) NOT NULL,
  PRIMARY KEY (codigo),
  FOREIGN KEY (codigo_pais) REFERENCES paises(codigo)
);
ALTER SEQUENCE regioes_seq OWNED BY regioes.codigo;

CREATE TABLE estados
(
  sigla CHAR(2) NOT NULL,
  codigo_pais SMALLINT NOT NULL,
  nome VARCHAR(40) NOT NULL,
  capital VARCHAR(40),
  area INTEGER,
  codigo_regiao SMALLINT,
  PRIMARY KEY (sigla),
  FOREIGN KEY (codigo_pais) REFERENCES paises(codigo),
  FOREIGN KEY (codigo_regiao) REFERENCES regioes (codigo)
);

CREATE SEQUENCE cidades_seq;
CREATE TABLE cidades
(
  codigo INTEGER NOT NULL DEFAULT NEXTVAL('cidades_seq'),
  estado CHAR(2) NOT NULL,
  nome VARCHAR(50) NOT NULL,
  ddd SMALLINT,
  PRIMARY KEY (codigo),
  FOREIGN KEY (estado) REFERENCES estados(sigla)
);
ALTER SEQUENCE cidades_seq OWNED BY cidades.codigo;

