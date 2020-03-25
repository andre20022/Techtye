-- phpMyAdmin SQL Dump
-- version 5.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 25-Mar-2020 às 12:08
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
-- Banco de dados: `tcc`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_agendamento_avulso`
--

CREATE TABLE `tb_agendamento_avulso` (
  `agv_codigo` int(11) NOT NULL,
  `agv_servico` int(11) NOT NULL,
  `agv_funcionario` int(11) NOT NULL,
  `agv_cliente` int(11) NOT NULL,
  `agv_dta_atendimento` datetime NOT NULL,
  `agv_status` varchar(40) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_agendamento_pacote`
--

CREATE TABLE `tb_agendamento_pacote` (
  `agp_codigo` int(11) NOT NULL,
  `agp_servico` int(11) NOT NULL,
  `agp_funcionario` int(11) NOT NULL,
  `agp_cliente` int(11) NOT NULL,
  `agp_dta_agendamento` datetime NOT NULL,
  `agp_status` varchar(40) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_centro_custo`
--

CREATE TABLE `tb_centro_custo` (
  `cc_cogido` int(11) NOT NULL,
  `cc_descricao` varchar(100) NOT NULL,
  `cc_ativo` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

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
  `dfn_telefone` varchar(14) DEFAULT NULL,
  `dfn_celular` varchar(14) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_dados_usuario`
--

CREATE TABLE `tb_dados_usuario` (
  `dusu_codigo` int(11) NOT NULL,
  `dusu_tb_codigo` int(11) NOT NULL,
  `dusu_endereco` varchar(60) NOT NULL,
  `dusu_numero` int(11) NOT NULL,
  `dusu_cep` int(11) NOT NULL,
  `dusu_telefone` varchar(14) DEFAULT NULL,
  `dusu_celular` varchar(14) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `tb_dados_usuario`
--

INSERT INTO `tb_dados_usuario` (`dusu_codigo`, `dusu_tb_codigo`, `dusu_endereco`, `dusu_numero`, `dusu_cep`, `dusu_telefone`, `dusu_celular`) VALUES
(1, 2, 'andre silva do nascimento', 34532, 232424, '233253', '346436'),
(2, 3, 'monte alegre do sul', 1134, 2859080, '1139717396', '1195918423');

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_dispesa`
--

CREATE TABLE `tb_dispesa` (
  `dis_codigo` int(11) NOT NULL,
  `dis_fornecedor` int(11) NOT NULL,
  `dis_valor` decimal(10,2) NOT NULL,
  `dis_descricao` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_fatura`
--

CREATE TABLE `tb_fatura` (
  `fat_codigo` int(11) NOT NULL,
  `fat_cliente` int(11) NOT NULL,
  `fat_centro_custo` int(11) NOT NULL,
  `fat_data` int(11) NOT NULL,
  `fat_valor` decimal(10,2) NOT NULL,
  `fat_vencimento` date NOT NULL,
  `fat_agedamento_pa` int(11) DEFAULT NULL,
  `fat_agedamento_av` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_fornecedor`
--

CREATE TABLE `tb_fornecedor` (
  `fnd_codigo` int(11) NOT NULL,
  `fnd_nome` varchar(50) NOT NULL,
  `fnd_descricao` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_funcionario`
--

CREATE TABLE `tb_funcionario` (
  `fun_codigo` int(11) NOT NULL,
  `fun_nome` varchar(50) NOT NULL,
  `fun_cpf` varchar(14) NOT NULL,
  `fun_email` varchar(60) NOT NULL,
  `fun_senha` varchar(50) NOT NULL,
  `fun_nivel` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `tb_funcionario`
--

INSERT INTO `tb_funcionario` (`fun_codigo`, `fun_nome`, `fun_cpf`, `fun_email`, `fun_senha`, `fun_nivel`) VALUES
(1, 'joao', '4576547754', 'joao@gmail.com', '12345', 2),
(2, 'pedro', '6585647457', 'pedro@gmail.com', '123456', 2);

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_niveis_de_acesso`
--

CREATE TABLE `tb_niveis_de_acesso` (
  `nv_codigo` int(11) NOT NULL,
  `nv_tipo` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `tb_niveis_de_acesso`
--

INSERT INTO `tb_niveis_de_acesso` (`nv_codigo`, `nv_tipo`) VALUES
(1, 'admin'),
(2, 'profissional'),
(3, 'funcionario'),
(4, 'cliente');

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_servico`
--

CREATE TABLE `tb_servico` (
  `sv_codigo` int(11) NOT NULL,
  `sv_funcionario` int(11) NOT NULL,
  `sv_nome` varchar(50) NOT NULL,
  `sv_descricao` varchar(100) NOT NULL,
  `sv_valor` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `tb_servico`
--

INSERT INTO `tb_servico` (`sv_codigo`, `sv_funcionario`, `sv_nome`, `sv_descricao`, `sv_valor`) VALUES
(1, 1, 'depilacao', 'boa depilacao', '80.00'),
(2, 2, 'corte', 'bom corte', '30.00');

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_usuario`
--

CREATE TABLE `tb_usuario` (
  `usu_cod` int(11) NOT NULL,
  `usu_nome` varchar(50) NOT NULL,
  `usu_cpf` varchar(14) NOT NULL,
  `usu_nivel` int(11) NOT NULL,
  `usu_login` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `tb_usuario`
--

INSERT INTO `tb_usuario` (`usu_cod`, `usu_nome`, `usu_cpf`, `usu_nivel`, `usu_login`) VALUES
(2, 'andre silva do nascimento', '06743611131', 4, 3),
(3, 'carlos', '4656565', 4, 4);

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_usuario_login`
--

CREATE TABLE `tb_usuario_login` (
  `usul_codigo` int(11) NOT NULL,
  `usul_login` varchar(50) NOT NULL,
  `usul_senha` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `tb_usuario_login`
--

INSERT INTO `tb_usuario_login` (`usul_codigo`, `usul_login`, `usul_senha`) VALUES
(3, 'andresilva1@gmail.com', '1234'),
(4, 'carlos@gmail.com', '121212');

--
-- Índices para tabelas despejadas
--

--
-- Índices para tabela `tb_agendamento_avulso`
--
ALTER TABLE `tb_agendamento_avulso`
  ADD PRIMARY KEY (`agv_codigo`),
  ADD KEY `fk_cod_sv` (`agv_servico`),
  ADD KEY `fk_cod_usu_agv` (`agv_cliente`),
  ADD KEY `fk_funcionario_cod` (`agv_funcionario`);

--
-- Índices para tabela `tb_agendamento_pacote`
--
ALTER TABLE `tb_agendamento_pacote`
  ADD PRIMARY KEY (`agp_codigo`),
  ADD KEY `fk_cod_fun_agp` (`agp_funcionario`),
  ADD KEY `fk_cod_sv_agp` (`agp_servico`),
  ADD KEY `fk_cod_usu_agp` (`agp_cliente`);

--
-- Índices para tabela `tb_centro_custo`
--
ALTER TABLE `tb_centro_custo`
  ADD PRIMARY KEY (`cc_cogido`);

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
  ADD KEY `fk_cod_agp_fat` (`fat_agedamento_pa`),
  ADD KEY `fk_cod_agv_fat` (`fat_agedamento_av`),
  ADD KEY `fk_cod_cc_fat` (`fat_centro_custo`),
  ADD KEY `fk_cod_usu_fat` (`fat_cliente`);

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
  ADD KEY `cod_acesso` (`fun_nivel`);

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
  ADD UNIQUE KEY `usu_login` (`usu_login`),
  ADD KEY `cod_usu_nivel` (`usu_nivel`);

--
-- Índices para tabela `tb_usuario_login`
--
ALTER TABLE `tb_usuario_login`
  ADD PRIMARY KEY (`usul_codigo`);

--
-- AUTO_INCREMENT de tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `tb_agendamento_avulso`
--
ALTER TABLE `tb_agendamento_avulso`
  MODIFY `agv_codigo` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `tb_agendamento_pacote`
--
ALTER TABLE `tb_agendamento_pacote`
  MODIFY `agp_codigo` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `tb_centro_custo`
--
ALTER TABLE `tb_centro_custo`
  MODIFY `cc_cogido` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `tb_dados_funcionario`
--
ALTER TABLE `tb_dados_funcionario`
  MODIFY `dfn_codigo` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `tb_dados_usuario`
--
ALTER TABLE `tb_dados_usuario`
  MODIFY `dusu_codigo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de tabela `tb_dispesa`
--
ALTER TABLE `tb_dispesa`
  MODIFY `dis_codigo` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `tb_fatura`
--
ALTER TABLE `tb_fatura`
  MODIFY `fat_codigo` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `tb_fornecedor`
--
ALTER TABLE `tb_fornecedor`
  MODIFY `fnd_codigo` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `tb_funcionario`
--
ALTER TABLE `tb_funcionario`
  MODIFY `fun_codigo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de tabela `tb_niveis_de_acesso`
--
ALTER TABLE `tb_niveis_de_acesso`
  MODIFY `nv_codigo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de tabela `tb_servico`
--
ALTER TABLE `tb_servico`
  MODIFY `sv_codigo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de tabela `tb_usuario`
--
ALTER TABLE `tb_usuario`
  MODIFY `usu_cod` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de tabela `tb_usuario_login`
--
ALTER TABLE `tb_usuario_login`
  MODIFY `usul_codigo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Restrições para despejos de tabelas
--

--
-- Limitadores para a tabela `tb_agendamento_avulso`
--
ALTER TABLE `tb_agendamento_avulso`
  ADD CONSTRAINT `fk_cod_sv` FOREIGN KEY (`agv_servico`) REFERENCES `tb_servico` (`sv_codigo`),
  ADD CONSTRAINT `fk_cod_usu_agv` FOREIGN KEY (`agv_cliente`) REFERENCES `tb_usuario` (`usu_cod`),
  ADD CONSTRAINT `fk_funcionario_cod` FOREIGN KEY (`agv_funcionario`) REFERENCES `tb_funcionario` (`fun_codigo`);

--
-- Limitadores para a tabela `tb_agendamento_pacote`
--
ALTER TABLE `tb_agendamento_pacote`
  ADD CONSTRAINT `fk_cod_fun_agp` FOREIGN KEY (`agp_funcionario`) REFERENCES `tb_funcionario` (`fun_codigo`),
  ADD CONSTRAINT `fk_cod_sv_agp` FOREIGN KEY (`agp_servico`) REFERENCES `tb_servico` (`sv_codigo`),
  ADD CONSTRAINT `fk_cod_usu_agp` FOREIGN KEY (`agp_cliente`) REFERENCES `tb_usuario` (`usu_cod`);

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
  ADD CONSTRAINT `fk_cod_agp_fat` FOREIGN KEY (`fat_agedamento_pa`) REFERENCES `tb_agendamento_pacote` (`agp_codigo`),
  ADD CONSTRAINT `fk_cod_agv_fat` FOREIGN KEY (`fat_agedamento_av`) REFERENCES `tb_agendamento_avulso` (`agv_codigo`),
  ADD CONSTRAINT `fk_cod_cc_fat` FOREIGN KEY (`fat_centro_custo`) REFERENCES `tb_centro_custo` (`cc_cogido`),
  ADD CONSTRAINT `fk_cod_usu_fat` FOREIGN KEY (`fat_cliente`) REFERENCES `tb_usuario` (`usu_cod`);

--
-- Limitadores para a tabela `tb_funcionario`
--
ALTER TABLE `tb_funcionario`
  ADD CONSTRAINT `cod_acesso` FOREIGN KEY (`fun_nivel`) REFERENCES `tb_niveis_de_acesso` (`nv_codigo`);

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
  ADD CONSTRAINT `fk_login` FOREIGN KEY (`usu_login`) REFERENCES `tb_usuario_login` (`usul_codigo`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
