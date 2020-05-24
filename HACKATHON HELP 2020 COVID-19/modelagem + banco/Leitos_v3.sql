-- --------------------------------------------------------
-- Servidor:                     127.0.0.1
-- VersÃ£o do servidor:           5.6.35 - MySQL Community Server (GPL)
-- OS do Servidor:               Win32
-- HeidiSQL VersÃ£o:              11.0.0.5919
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


-- Copiando estrutura do banco de dados para leitos
CREATE DATABASE IF NOT EXISTS `leitos` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `leitos`;

-- Copiando estrutura para tabela leitos.administrador
CREATE TABLE IF NOT EXISTS `administrador` (
  `id_administrador` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(80) NOT NULL,
  `cpf` char(11) NOT NULL UNIQUE,
  `matricula` char(15) NOT NULL,
  `email` varchar(40) NOT NULL,
  `login` varchar(20) NOT NULL,
  `senha` varchar(20) NOT NULL,
  PRIMARY KEY (`id_administrador`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Copiando dados para a tabela leitos.administrador: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `administrador` DISABLE KEYS */;
/*!40000 ALTER TABLE `administrador` ENABLE KEYS */;

-- Copiando estrutura para tabela leitos.tipo_unidade_de_saude
CREATE TABLE IF NOT EXISTS `tipo_unidade_de_saude` (
  `id_tipo_unidade_de_saude` int(11) NOT NULL,
  `desc_tipo_unidade_de_saude` varchar(10) NOT NULL,
  PRIMARY KEY (`id_tipo_unidade_de_saude`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Copiando dados para a tabela leitos.tipo_unidade_de_saude: ~3 rows (aproximadamente)
/*!40000 ALTER TABLE `tipo_unidade_de_saude` DISABLE KEYS */;
INSERT INTO `tipo_unidade_de_saude` (`id_tipo_unidade_de_saude`, `desc_tipo_unidade_de_saude`) VALUES
	(1, 'Publico'),
	(2, 'Privado'),
	(3, 'Campanha');
/*!40000 ALTER TABLE `tipo_unidade_de_saude` ENABLE KEYS */;

-- Copiando estrutura para tabela leitos.unidade_de_saude
CREATE TABLE IF NOT EXISTS `unidade_de_saude` (
  `id_unidade_de_saude` int(11) NOT NULL AUTO_INCREMENT,
  `nome_unidade_de_saude` varchar(40) NOT NULL,
  `id_tipo_unidade_de_saude` int(11) NOT NULL,
  `cep` char(8) NOT NULL,
  `logradouro` varchar(40) NOT NULL,
  `numero` varchar(6) DEFAULT NULL,
  `bairro` varchar(15) NOT NULL,
  `cidade` varchar(25) NOT NULL,
  `uf` char(2) NOT NULL,
  `login` varchar(20) NOT NULL,
  `senha` varchar(30) NOT NULL,
  `leitos_disponiveis` int(11) NOT NULL DEFAULT '0',
  `ultima_atualizacao` datetime NOT NULL,
  `id_administrador` int(11) NOT NULL,
  PRIMARY KEY (`id_unidade_de_saude`),
  KEY `id_tipo_unidade_de_saude` (`id_tipo_unidade_de_saude`),
  KEY `id_administrador` (`id_administrador`),
  CONSTRAINT `id_administrador` FOREIGN KEY (`id_administrador`) REFERENCES `administrador` (`id_administrador`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `id_tipo_unidade_de_saude` FOREIGN KEY (`id_tipo_unidade_de_saude`) REFERENCES `tipo_unidade_de_saude` (`id_tipo_unidade_de_saude`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Copiando dados para a tabela leitos.unidade_de_saude: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `unidade_de_saude` DISABLE KEYS */;
/*!40000 ALTER TABLE `unidade_de_saude` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
