
CREATE DATABASE controleacesso;

\connect controleacesso;

BEGIN;
CREATE SEQUENCE usuarios_seq;
CREATE TABLE usuarios
(
  codigo INTEGER NOT NULL DEFAULT NEXTVAL('usuarios_seq'),
  nome VARCHAR(60) NOT NULL,
  login VARCHAR(15) NOT NULL,
  senha VARCHAR(128) NOT NULL,
  PRIMARY KEY (codigo)
);
ALTER SEQUENCE usuarios_seq OWNED BY usuarios.codigo;

CREATE SEQUENCE perfis_seq;
CREATE TABLE perfis
(
  codigo INTEGER NOT NULL DEFAULT NEXTVAL('perfis_seq'),
  nome VARCHAR(60) NOT NULL,
  PRIMARY KEY (codigo)
);
ALTER SEQUENCE perfis_seq OWNED BY perfis.codigo;

CREATE TABLE usuarios_perfis
(
  codigo_usuario INTEGER NOT NULL,
  codigo_perfil INTEGER NOT NULL,
  PRIMARY KEY (codigo_usuario, codigo_perfil),
  FOREIGN KEY (codigo_usuario) REFERENCES usuarios(codigo),
  FOREIGN KEY (codigo_perfil) REFERENCES perfis(codigo)
);


