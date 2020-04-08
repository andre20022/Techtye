-- phpMyAdmin SQL Dump
-- version 5.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 08-Abr-2020 às 03:49
-- Versão do servidor: 10.4.11-MariaDB
-- versão do PHP: 7.3.15

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `banco`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_agendamento_avulso`
--

CREATE TABLE `tb_agendamento_avulso` (
  `agv_codigo` int(11) NOT NULL,
  `agv_servico` int(11) DEFAULT NULL,
  `agv_funcionario` int(11) DEFAULT NULL,
  `agv_cliente` int(11) DEFAULT NULL,
  `agv_dta_atendimento` datetime NOT NULL,
  `agv_status` varchar(40) NOT NULL,
  `agv_fatura` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_agendamento_pacote`
--

CREATE TABLE `tb_agendamento_pacote` (
  `agp_codigo` int(11) NOT NULL,
  `agp_servico` int(11) DEFAULT NULL,
  `agp_funcionario` int(11) DEFAULT NULL,
  `agp_cliente` int(11) DEFAULT NULL,
  `agp_dta_agendamento` datetime NOT NULL,
  `agp_status` varchar(40) NOT NULL,
  `agp_fatura` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_centro_custo`
--

CREATE TABLE `tb_centro_custo` (
  `cc_cogido` int(11) NOT NULL,
  `cc_descricao` varchar(100) NOT NULL,
  `cc_status` tinyint(1) NOT NULL,
  `cc_dispesa` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_dados_funcionario`
--

CREATE TABLE `tb_dados_funcionario` (
  `dfn_codigo` int(11) NOT NULL,
  `dfn_funcionario` int(11) NOT NULL,
  `dfn_endereco` varchar(60) NOT NULL,
  `dfn_numero` int(11) NOT NULL,
  `dfn_cep` int(11) NOT NULL,
  `dfn_telefone` varchar(14) NOT NULL,
  `dfn_celular` varchar(14) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_dados_usuario`
--

CREATE TABLE `tb_dados_usuario` (
  `dusu_codigo` int(11) NOT NULL,
  `dusu_tb_codigo` int(11) DEFAULT NULL,
  `dusu_endereco` varchar(60) NOT NULL,
  `dusu_numero` int(11) NOT NULL,
  `dusu_cep` int(11) NOT NULL,
  `dusu_telefone` varchar(14) NOT NULL,
  `dusu_celular` varchar(14) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_dispesa`
--

CREATE TABLE `tb_dispesa` (
  `dis_codigo` int(11) NOT NULL,
  `dis_fornecedor` int(11) DEFAULT NULL,
  `dis_valor` decimal(10,2) NOT NULL,
  `dis_descricao` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_fatura`
--

CREATE TABLE `tb_fatura` (
  `fat_codigo` int(11) NOT NULL,
  `fat_centro_custo` int(11) DEFAULT NULL,
  `fat_data` date NOT NULL,
  `fat_valor` decimal(10,2) NOT NULL,
  `fat_vencimento` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_fornecedor`
--

CREATE TABLE `tb_fornecedor` (
  `fnd_codigo` int(11) NOT NULL,
  `fnd_nome` varchar(50) NOT NULL,
  `fnd_descricao` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_funcionario`
--

CREATE TABLE `tb_funcionario` (
  `fun_codigo` int(11) NOT NULL,
  `fun_nome` varchar(50) NOT NULL,
  `fun_cpf` varchar(14) NOT NULL,
  `fun_nivel` int(11) DEFAULT NULL,
  `fun_login` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_login`
--

CREATE TABLE `tb_login` (
  `lg_codigo` int(11) NOT NULL,
  `lg_email` varchar(50) NOT NULL,
  `lg_senha` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_niveis_de_acesso`
--

CREATE TABLE `tb_niveis_de_acesso` (
  `nv_codigo` int(11) NOT NULL,
  `nv_tipo` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_servico`
--

CREATE TABLE `tb_servico` (
  `sv_codigo` int(11) NOT NULL,
  `sv_funcionario` int(11) DEFAULT NULL,
  `sv_nome` varchar(50) NOT NULL,
  `sv_descricao` varchar(100) NOT NULL,
  `sv_valor` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_usuario`
--

CREATE TABLE `tb_usuario` (
  `usu_cod` int(11) NOT NULL,
  `usu_nome` varchar(50) NOT NULL,
  `usu_cpf` varchar(14) NOT NULL,
  `usu_nivel` int(11) DEFAULT NULL,
  `usu_login` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Índices para tabelas despejadas
--

--
-- Índices para tabela `tb_agendamento_avulso`
--
ALTER TABLE `tb_agendamento_avulso`
  ADD PRIMARY KEY (`agv_codigo`),
  ADD KEY `fk_funcionario_cod` (`agv_funcionario`),
  ADD KEY `fk_cod_usu_agv` (`agv_cliente`),
  ADD KEY `fk_cod_sv` (`agv_servico`),
  ADD KEY `fk_cod_fatura_agv` (`agv_fatura`);

--
-- Índices para tabela `tb_agendamento_pacote`
--
ALTER TABLE `tb_agendamento_pacote`
  ADD PRIMARY KEY (`agp_codigo`),
  ADD KEY `fk_cod_sv_agp` (`agp_servico`),
  ADD KEY `fk_cod_usu_agp` (`agp_cliente`),
  ADD KEY `fk_cod_fun_agp` (`agp_funcionario`),
  ADD KEY `FK_tb_agendamento_pacote_5` (`agp_fatura`);

--
-- Índices para tabela `tb_centro_custo`
--
ALTER TABLE `tb_centro_custo`
  ADD PRIMARY KEY (`cc_cogido`),
  ADD KEY `tk_dispesa_cc` (`cc_dispesa`);

--
-- Índices para tabela `tb_dados_funcionario`
--
ALTER TABLE `tb_dados_funcionario`
  ADD PRIMARY KEY (`dfn_codigo`),
  ADD KEY `cod_funcionario` (`dfn_funcionario`);

--
-- Índices para tabela `tb_dados_usuario`
--
ALTER TABLE `tb_dados_usuario`
  ADD PRIMARY KEY (`dusu_codigo`),
  ADD KEY `cod_usuario` (`dusu_tb_codigo`);

--
-- Índices para tabela `tb_dispesa`
--
ALTER TABLE `tb_dispesa`
  ADD PRIMARY KEY (`dis_codigo`),
  ADD KEY `fk_cod_fornecedor` (`dis_fornecedor`);

--
-- Índices para tabela `tb_fatura`
--
ALTER TABLE `tb_fatura`
  ADD PRIMARY KEY (`fat_codigo`),
  ADD KEY `fk_cod_cc_fat` (`fat_centro_custo`);

--
-- Índices para tabela `tb_fornecedor`
--
ALTER TABLE `tb_fornecedor`
  ADD PRIMARY KEY (`fnd_codigo`);

--
-- Índices para tabela `tb_funcionario`
--
ALTER TABLE `tb_funcionario`
  ADD PRIMARY KEY (`fun_codigo`),
  ADD KEY `cod_acesso` (`fun_nivel`),
  ADD KEY `fk_login` (`fun_login`);

--
-- Índices para tabela `tb_login`
--
ALTER TABLE `tb_login`
  ADD PRIMARY KEY (`lg_codigo`);

--
-- Índices para tabela `tb_niveis_de_acesso`
--
ALTER TABLE `tb_niveis_de_acesso`
  ADD PRIMARY KEY (`nv_codigo`);

--
-- Índices para tabela `tb_servico`
--
ALTER TABLE `tb_servico`
  ADD PRIMARY KEY (`sv_codigo`),
  ADD KEY `fk_cod_fun_sv` (`sv_funcionario`);

--
-- Índices para tabela `tb_usuario`
--
ALTER TABLE `tb_usuario`
  ADD PRIMARY KEY (`usu_cod`),
  ADD KEY `cod_usu_nivel` (`usu_nivel`),
  ADD KEY `fk_usu_logi` (`usu_login`);

--
-- Restrições para despejos de tabelas
--

--
-- Limitadores para a tabela `tb_agendamento_avulso`
--
ALTER TABLE `tb_agendamento_avulso`
  ADD CONSTRAINT `fk_cod_fatura_agv` FOREIGN KEY (`agv_fatura`) REFERENCES `tb_fatura` (`fat_codigo`),
  ADD CONSTRAINT `fk_cod_sv` FOREIGN KEY (`agv_servico`) REFERENCES `tb_servico` (`sv_codigo`),
  ADD CONSTRAINT `fk_cod_usu_agv` FOREIGN KEY (`agv_cliente`) REFERENCES `tb_usuario` (`usu_cod`),
  ADD CONSTRAINT `fk_funcionario_cod` FOREIGN KEY (`agv_funcionario`) REFERENCES `tb_funcionario` (`fun_codigo`);

--
-- Limitadores para a tabela `tb_agendamento_pacote`
--
ALTER TABLE `tb_agendamento_pacote`
  ADD CONSTRAINT `FK_tb_agendamento_pacote_5` FOREIGN KEY (`agp_fatura`) REFERENCES `tb_fatura` (`fat_codigo`),
  ADD CONSTRAINT `fk_cod_fun_agp` FOREIGN KEY (`agp_funcionario`) REFERENCES `tb_funcionario` (`fun_codigo`),
  ADD CONSTRAINT `fk_cod_sv_agp` FOREIGN KEY (`agp_servico`) REFERENCES `tb_servico` (`sv_codigo`),
  ADD CONSTRAINT `fk_cod_usu_agp` FOREIGN KEY (`agp_cliente`) REFERENCES `tb_usuario` (`usu_cod`);

--
-- Limitadores para a tabela `tb_centro_custo`
--
ALTER TABLE `tb_centro_custo`
  ADD CONSTRAINT `tk_dispesa_cc` FOREIGN KEY (`cc_dispesa`) REFERENCES `tb_dispesa` (`dis_codigo`);

--
-- Limitadores para a tabela `tb_dados_funcionario`
--
ALTER TABLE `tb_dados_funcionario`
  ADD CONSTRAINT `cod_funcionario` FOREIGN KEY (`dfn_funcionario`) REFERENCES `tb_funcionario` (`fun_codigo`);

--
-- Limitadores para a tabela `tb_dados_usuario`
--
ALTER TABLE `tb_dados_usuario`
  ADD CONSTRAINT `cod_usuario` FOREIGN KEY (`dusu_tb_codigo`) REFERENCES `tb_usuario` (`usu_cod`);

--
-- Limitadores para a tabela `tb_dispesa`
--
ALTER TABLE `tb_dispesa`
  ADD CONSTRAINT `fk_cod_fornecedor` FOREIGN KEY (`dis_fornecedor`) REFERENCES `tb_fornecedor` (`fnd_codigo`);

--
-- Limitadores para a tabela `tb_fatura`
--
ALTER TABLE `tb_fatura`
  ADD CONSTRAINT `fk_cod_cc_fat` FOREIGN KEY (`fat_centro_custo`) REFERENCES `tb_centro_custo` (`cc_cogido`);

--
-- Limitadores para a tabela `tb_funcionario`
--
ALTER TABLE `tb_funcionario`
  ADD CONSTRAINT `cod_acesso` FOREIGN KEY (`fun_nivel`) REFERENCES `tb_niveis_de_acesso` (`nv_codigo`),
  ADD CONSTRAINT `fk_login` FOREIGN KEY (`fun_login`) REFERENCES `tb_login` (`lg_codigo`);

--
-- Limitadores para a tabela `tb_servico`
--
ALTER TABLE `tb_servico`
  ADD CONSTRAINT `fk_cod_fun_sv` FOREIGN KEY (`sv_funcionario`) REFERENCES `tb_funcionario` (`fun_codigo`);

--
-- Limitadores para a tabela `tb_usuario`
--
ALTER TABLE `tb_usuario`
  ADD CONSTRAINT `cod_usu_nivel` FOREIGN KEY (`usu_nivel`) REFERENCES `tb_niveis_de_acesso` (`nv_codigo`),
  ADD CONSTRAINT `fk_usu_logi` FOREIGN KEY (`usu_login`) REFERENCES `tb_login` (`lg_codigo`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
