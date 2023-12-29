
CREATE DATABASE locadoraveiculos;

\connect locadoraveiculos; 

CREATE SEQUENCE clientes_seq;
CREATE TABLE clientes
( 
  codigo INTEGER NOT NULL DEFAULT NEXTVAL('clientes_seq'),
  nome VARCHAR(60) NOT NULL, 
  telefone VARCHAR(15) NOT NULL, 
  cpf VARCHAR(15) NOT NULL, 
  rg VARCHAR(15) NOT NULL, 
  cnh VARCHAR(15) NOT NULL, 
  data_nascimento DATE NOT NULL, 
  genero VARCHAR(45) NOT NULL, 
  PRIMARY KEY (codigo)
);
ALTER SEQUENCE clientes_seq OWNED BY clientes.codigo;

CREATE SEQUENCE funcionarios_seq;
CREATE TABLE funcionarios
( 
  codigo INTEGER NOT NULL DEFAULT NEXTVAL('funcionarios_seq'),
  nome VARCHAR(60) NOT NULL, 
  telefone VARCHAR(15) NOT NULL, 
  cpf VARCHAR(15) NOT NULL, 
  rg VARCHAR(15) NOT NULL, 
  data_nascimento DATE NOT NULL, 
  genero VARCHAR(45) NOT NULL, 
  PRIMARY KEY (codigo)
);
ALTER SEQUENCE funcionarios_seq OWNED BY funcionarios.codigo;

CREATE TYPE veiculos_status_enum AS ENUM ('disponivel', 'manutencao', 'locado');
CREATE SEQUENCE veiculos_seq;
CREATE TABLE veiculos
( 
  codigo INTEGER NOT NULL DEFAULT NEXTVAL('veiculos_seq'),
  marca VARCHAR(45) NOT NULL, 
  modelo VARCHAR(45) NOT NULL, 
  portas INTEGER NOT NULL,
  passageiros INTEGER NOT NULL,
  placa CHAR(8) NOT NULL, 
  valor_diaria DECIMAL(10,2) NOT NULL, 
  status veiculos_status_enum NOT NULL, 
  PRIMARY KEY (codigo)
);
ALTER SEQUENCE veiculos_seq OWNED BY veiculos.codigo;

CREATE SEQUENCE locacoes_seq;
CREATE TABLE locacoes
( 
  codigo INTEGER NOT NULL DEFAULT NEXTVAL('locacoes_seq'),
  datahora_contrato TIMESTAMP NOT NULL, 
  datahora_retirada TIMESTAMP NOT NULL, 
  datahora_devolucao TIMESTAMP NOT NULL, 
  codigo_funcionario INTEGER NOT NULL, 
  codigo_cliente INTEGER NOT NULL, 
  valor_locacao DECIMAL(10,2) NOT NULL, 
  PRIMARY KEY (codigo),
  FOREIGN KEY (codigo_funcionario) REFERENCES funcionarios (codigo) ON DELETE NO ACTION ON UPDATE CASCADE,
  FOREIGN KEY (codigo_cliente) REFERENCES clientes (codigo) ON DELETE NO ACTION ON UPDATE NO ACTION
);
ALTER SEQUENCE locacoes_seq OWNED BY locacoes.codigo;

CREATE TABLE locacoes_veiculos
( 
  codigo_locacao INTEGER NOT NULL, 
  codigo_veiculo INTEGER NOT NULL, 
  PRIMARY KEY (codigo_locacao, codigo_veiculo),
  FOREIGN KEY (codigo_locacao) REFERENCES locacoes (codigo) ON DELETE CASCADE ON UPDATE CASCADE,
  FOREIGN KEY (codigo_veiculo) REFERENCES veiculos (codigo) ON DELETE NO ACTION ON UPDATE CASCADE
);


