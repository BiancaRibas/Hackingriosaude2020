CREATE TABLE IF NOT EXISTS administrador (
  id_administrador serial NOT NULL,
  nome varchar(80) NOT NULL,
  cpf char(11) UNIQUE NOT NULL,
  matricula char(15) NOT NULL,
  email varchar(40) NOT NULL,
  login varchar(20) NOT NULL,
  senha varchar(20) NOT NULL,
  PRIMARY KEY (id_administrador)
);


CREATE TABLE IF NOT EXISTS tipo_unidade_de_saude (
  id_tipo_unidade_de_saude serial NOT NULL,
  desc_tipo_unidade_de_saude varchar(10) NOT NULL,
  PRIMARY KEY (id_tipo_unidade_de_saude)
);


INSERT INTO tipo_unidade_de_saude (id_tipo_unidade_de_saude, desc_tipo_unidade_de_saude) VALUES
	(1, 'Publico'),
	(2, 'Privado'),
	(3, 'Campanha');


CREATE TABLE IF NOT EXISTS unidade_de_saude (
  id_unidade_de_saude serial NOT NULL,
  nome_unidade_de_saude varchar(40) NOT NULL,
  id_tipo_unidade_de_saude serial NOT NULL,
  cep char(8) NOT NULL,
  logradouro varchar(40) NOT NULL,
  numero int DEFAULT NULL,
  bairro varchar(15) NOT NULL,
  cidade varchar(25) NOT NULL,
  uf char(2) NOT NULL,
  login varchar(20) NOT NULL,
  senha varchar(30) NOT NULL,
  leitos_disponiveis int NOT NULL DEFAULT '0',
  ultima_atualizacao timestamp NOT NULL,
  id_administrador serial NOT NULL,
  PRIMARY KEY (id_unidade_de_saude)
);

ALTER TABLE unidade_de_saude
  ADD CONSTRAINT id_administrador
  FOREIGN KEY (id_administrador)
  REFERENCES administrador (id_administrador);
  
ALTER TABLE unidade_de_saude
  ADD CONSTRAINT id_tipo_unidade_de_saude
  FOREIGN KEY (id_tipo_unidade_de_saude)
  REFERENCES tipo_unidade_de_saude (id_tipo_unidade_de_saude);
  