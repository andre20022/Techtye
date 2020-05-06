-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 07-Maio-2020 às 00:23
-- Versão do servidor: 10.4.11-MariaDB
-- versão do PHP: 7.3.16

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
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
  `agv_servico` int(11) DEFAULT NULL,
  `agv_cliente` int(11) DEFAULT NULL,
  `agv_dta_agendamento` date NOT NULL,
  `agv_dta_mes_agendamento` varchar(50) NOT NULL,
  `agv_dta_hora` time NOT NULL,
  `agv_status` varchar(40) NOT NULL,
  `agv_fatura` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_agendamento_pacote`
--

CREATE TABLE `tb_agendamento_pacote` (
  `agp_codigo` int(11) NOT NULL,
  `agp_pacote` int(11) DEFAULT NULL,
  `agp_cliente` int(11) DEFAULT NULL,
  `agp_dta_agendamento` date NOT NULL,
  `agp_dta_mes_agendamento` varchar(40) NOT NULL,
  `agp_dta_hora` time NOT NULL,
  `agp_status` varchar(40) NOT NULL,
  `agp_fatura` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_categorias`
--

CREATE TABLE `tb_categorias` (
  `ctg_codigo` int(11) NOT NULL,
  `ctg_nome` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `tb_categorias`
--

INSERT INTO `tb_categorias` (`ctg_codigo`, `ctg_nome`) VALUES
(3, 'podologia'),
(4, 'Massagem');

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_centro_custo`
--

CREATE TABLE `tb_centro_custo` (
  `cc_codigo` int(11) NOT NULL,
  `cc_descricao` varchar(100) NOT NULL,
  `cc_status` tinyint(1) NOT NULL,
  `cc_dispesa` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_cliente`
--

CREATE TABLE `tb_cliente` (
  `usu_cod` int(11) NOT NULL,
  `usu_nome` varchar(50) NOT NULL,
  `usu_cpf` varchar(14) NOT NULL,
  `usu_nivel` int(11) DEFAULT NULL,
  `usu_login` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `tb_cliente`
--

INSERT INTO `tb_cliente` (`usu_cod`, `usu_nome`, `usu_cpf`, `usu_nivel`, `usu_login`) VALUES
(16, 'andre silva do nascimento', '06743611131', 4, 22),
(18, 'josicleide', '1234567889', 4, 24);

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_dados_cliente`
--

CREATE TABLE `tb_dados_cliente` (
  `dusu_codigo` int(11) NOT NULL,
  `dusu_tb_codigo` int(11) DEFAULT NULL,
  `dusu_endereco` varchar(60) NOT NULL,
  `dusu_numero` int(11) NOT NULL,
  `dusu_cep` int(11) NOT NULL,
  `dusu_telefone` varchar(14) DEFAULT NULL,
  `dusu_celular` varchar(14) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `tb_dados_cliente`
--

INSERT INTO `tb_dados_cliente` (`dusu_codigo`, `dusu_tb_codigo`, `dusu_endereco`, `dusu_numero`, `dusu_cep`, `dusu_telefone`, `dusu_celular`) VALUES
(5, 16, 'monte alegre do sul', 1134, 858568, '455454545345', '(11) 95091-842');

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `tb_dados_funcionario`
--

INSERT INTO `tb_dados_funcionario` (`dfn_codigo`, `dfn_funcionario`, `dfn_endereco`, `dfn_numero`, `dfn_cep`, `dfn_telefone`, `dfn_celular`) VALUES
(5, 3, 'monte alegre do sul', 1134, 2859080, '1139717396', '(11) 95091-842');

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
  `fat_data` date NOT NULL,
  `fat_valor` decimal(10,2) NOT NULL,
  `fat_vencimento` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `tb_fatura`
--

INSERT INTO `tb_fatura` (`fat_codigo`, `fat_data`, `fat_valor`, `fat_vencimento`) VALUES
(1, '2020-05-12', '80.00', '2020-05-25');

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

--
-- Extraindo dados da tabela `tb_funcionario`
--

INSERT INTO `tb_funcionario` (`fun_codigo`, `fun_nome`, `fun_cpf`, `fun_nivel`, `fun_login`) VALUES
(1, 'admin', '65463446643', 1, 23),
(2, 'jose', '65463446643', 2, 25),
(3, 'pedro', '65463446643', 3, 26);

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_itens_pacote`
--

CREATE TABLE `tb_itens_pacote` (
  `it_codigo` int(15) NOT NULL,
  `it_servico` int(15) NOT NULL,
  `it_pacote` int(15) NOT NULL
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

--
-- Extraindo dados da tabela `tb_login`
--

INSERT INTO `tb_login` (`lg_codigo`, `lg_email`, `lg_senha`) VALUES
(22, 'andresilvay6@gmail.com', '1234'),
(23, 'admin@gmail.com', '5555'),
(24, 'josicleide@gmail.com', '1234'),
(25, 'josse@gmail.com', 'jose'),
(26, 'pedro@gmail.com', '1234');

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_niveis_de_acesso`
--

CREATE TABLE `tb_niveis_de_acesso` (
  `nv_codigo` int(11) NOT NULL,
  `nv_tipo` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `tb_niveis_de_acesso`
--

INSERT INTO `tb_niveis_de_acesso` (`nv_codigo`, `nv_tipo`) VALUES
(1, 'admin'),
(2, 'funcionario'),
(3, 'profisicional'),
(4, 'cliente');

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_pacote`
--

CREATE TABLE `tb_pacote` (
  `pc_codigo` int(15) NOT NULL,
  `pc_descricao` varchar(100) NOT NULL,
  `pc_valor` decimal(10,2) NOT NULL,
  `pc_avalicao` int(15) NOT NULL,
  `pc_nome` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `tb_pacote`
--

INSERT INTO `tb_pacote` (`pc_codigo`, `pc_descricao`, `pc_valor`, `pc_avalicao`, `pc_nome`) VALUES
(2, 'bom pacote', '900.00', 5, 'Massagem triplex'),
(3, 'excelente pacote', '2000.00', 10, 'Massagem mundial');

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_servico`
--

CREATE TABLE `tb_servico` (
  `sv_codigo` int(11) NOT NULL,
  `sv_funcionario` int(11) DEFAULT NULL,
  `sv_nome` varchar(50) NOT NULL,
  `sv_descricao` varchar(100) NOT NULL,
  `sv_valor` decimal(10,2) NOT NULL,
  `sv_fotoServico` varchar(100) NOT NULL,
  `sv_categoria` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Índices para tabelas despejadas
--

--
-- Índices para tabela `tb_agendamento_avulso`
--
ALTER TABLE `tb_agendamento_avulso`
  ADD PRIMARY KEY (`agv_codigo`),
  ADD KEY `fk_cod_usu_agv` (`agv_cliente`),
  ADD KEY `fk_cod_sv` (`agv_servico`),
  ADD KEY `fk_cod_fatura_agv` (`agv_fatura`);

--
-- Índices para tabela `tb_agendamento_pacote`
--
ALTER TABLE `tb_agendamento_pacote`
  ADD PRIMARY KEY (`agp_codigo`),
  ADD KEY `fk_cod_usu_agp` (`agp_cliente`),
  ADD KEY `FK_tb_agendamento_pacote_5` (`agp_fatura`),
  ADD KEY `pacote` (`agp_pacote`);

--
-- Índices para tabela `tb_categorias`
--
ALTER TABLE `tb_categorias`
  ADD PRIMARY KEY (`ctg_codigo`);

--
-- Índices para tabela `tb_centro_custo`
--
ALTER TABLE `tb_centro_custo`
  ADD PRIMARY KEY (`cc_codigo`),
  ADD KEY `tk_dispesa_cc` (`cc_dispesa`);

--
-- Índices para tabela `tb_cliente`
--
ALTER TABLE `tb_cliente`
  ADD PRIMARY KEY (`usu_cod`),
  ADD KEY `cod_usu_nivel` (`usu_nivel`),
  ADD KEY `fk_usu_logi` (`usu_login`);

--
-- Índices para tabela `tb_dados_cliente`
--
ALTER TABLE `tb_dados_cliente`
  ADD PRIMARY KEY (`dusu_codigo`),
  ADD KEY `cod_usuario` (`dusu_tb_codigo`);

--
-- Índices para tabela `tb_dados_funcionario`
--
ALTER TABLE `tb_dados_funcionario`
  ADD PRIMARY KEY (`dfn_codigo`),
  ADD KEY `cod_funcionario` (`dfn_funcionario`);

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
  ADD PRIMARY KEY (`fat_codigo`);

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
-- Índices para tabela `tb_itens_pacote`
--
ALTER TABLE `tb_itens_pacote`
  ADD PRIMARY KEY (`it_codigo`),
  ADD UNIQUE KEY `it_pacote` (`it_pacote`),
  ADD KEY `servico` (`it_servico`);

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
-- Índices para tabela `tb_pacote`
--
ALTER TABLE `tb_pacote`
  ADD PRIMARY KEY (`pc_codigo`);

--
-- Índices para tabela `tb_servico`
--
ALTER TABLE `tb_servico`
  ADD PRIMARY KEY (`sv_codigo`),
  ADD KEY `fk_cod_fun_sv` (`sv_funcionario`),
  ADD KEY `sv_categoria` (`sv_categoria`);

--
-- AUTO_INCREMENT de tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `tb_agendamento_avulso`
--
ALTER TABLE `tb_agendamento_avulso`
  MODIFY `agv_codigo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de tabela `tb_agendamento_pacote`
--
ALTER TABLE `tb_agendamento_pacote`
  MODIFY `agp_codigo` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `tb_categorias`
--
ALTER TABLE `tb_categorias`
  MODIFY `ctg_codigo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de tabela `tb_centro_custo`
--
ALTER TABLE `tb_centro_custo`
  MODIFY `cc_codigo` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `tb_cliente`
--
ALTER TABLE `tb_cliente`
  MODIFY `usu_cod` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT de tabela `tb_dados_cliente`
--
ALTER TABLE `tb_dados_cliente`
  MODIFY `dusu_codigo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de tabela `tb_dados_funcionario`
--
ALTER TABLE `tb_dados_funcionario`
  MODIFY `dfn_codigo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de tabela `tb_dispesa`
--
ALTER TABLE `tb_dispesa`
  MODIFY `dis_codigo` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `tb_fatura`
--
ALTER TABLE `tb_fatura`
  MODIFY `fat_codigo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de tabela `tb_fornecedor`
--
ALTER TABLE `tb_fornecedor`
  MODIFY `fnd_codigo` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `tb_funcionario`
--
ALTER TABLE `tb_funcionario`
  MODIFY `fun_codigo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de tabela `tb_itens_pacote`
--
ALTER TABLE `tb_itens_pacote`
  MODIFY `it_codigo` int(15) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `tb_login`
--
ALTER TABLE `tb_login`
  MODIFY `lg_codigo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT de tabela `tb_niveis_de_acesso`
--
ALTER TABLE `tb_niveis_de_acesso`
  MODIFY `nv_codigo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de tabela `tb_pacote`
--
ALTER TABLE `tb_pacote`
  MODIFY `pc_codigo` int(15) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de tabela `tb_servico`
--
ALTER TABLE `tb_servico`
  MODIFY `sv_codigo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Restrições para despejos de tabelas
--

--
-- Limitadores para a tabela `tb_agendamento_avulso`
--
ALTER TABLE `tb_agendamento_avulso`
  ADD CONSTRAINT `fk_cod_fatura_agv` FOREIGN KEY (`agv_fatura`) REFERENCES `tb_fatura` (`fat_codigo`),
  ADD CONSTRAINT `fk_cod_sv` FOREIGN KEY (`agv_servico`) REFERENCES `tb_servico` (`sv_codigo`),
  ADD CONSTRAINT `fk_cod_usu_agv` FOREIGN KEY (`agv_cliente`) REFERENCES `tb_cliente` (`usu_cod`);

--
-- Limitadores para a tabela `tb_agendamento_pacote`
--
ALTER TABLE `tb_agendamento_pacote`
  ADD CONSTRAINT `FK_tb_agendamento_pacote_5` FOREIGN KEY (`agp_fatura`) REFERENCES `tb_fatura` (`fat_codigo`),
  ADD CONSTRAINT `fk_cod_pacote_agp` FOREIGN KEY (`agp_pacote`) REFERENCES `tb_pacote` (`pc_codigo`),
  ADD CONSTRAINT `fk_cod_usu_agp` FOREIGN KEY (`agp_cliente`) REFERENCES `tb_cliente` (`usu_cod`);

--
-- Limitadores para a tabela `tb_centro_custo`
--
ALTER TABLE `tb_centro_custo`
  ADD CONSTRAINT `tk_dispesa_cc` FOREIGN KEY (`cc_dispesa`) REFERENCES `tb_dispesa` (`dis_codigo`);

--
-- Limitadores para a tabela `tb_cliente`
--
ALTER TABLE `tb_cliente`
  ADD CONSTRAINT `cod_usu_nivel` FOREIGN KEY (`usu_nivel`) REFERENCES `tb_niveis_de_acesso` (`nv_codigo`),
  ADD CONSTRAINT `fk_usu_logi` FOREIGN KEY (`usu_login`) REFERENCES `tb_login` (`lg_codigo`);

--
-- Limitadores para a tabela `tb_dados_cliente`
--
ALTER TABLE `tb_dados_cliente`
  ADD CONSTRAINT `cod_usuario` FOREIGN KEY (`dusu_tb_codigo`) REFERENCES `tb_cliente` (`usu_cod`);

--
-- Limitadores para a tabela `tb_dados_funcionario`
--
ALTER TABLE `tb_dados_funcionario`
  ADD CONSTRAINT `cod_funcionario` FOREIGN KEY (`dfn_funcionario`) REFERENCES `tb_funcionario` (`fun_codigo`);

--
-- Limitadores para a tabela `tb_dispesa`
--
ALTER TABLE `tb_dispesa`
  ADD CONSTRAINT `fk_cod_fornecedor` FOREIGN KEY (`dis_fornecedor`) REFERENCES `tb_fornecedor` (`fnd_codigo`);

--
-- Limitadores para a tabela `tb_funcionario`
--
ALTER TABLE `tb_funcionario`
  ADD CONSTRAINT `cod_acesso` FOREIGN KEY (`fun_nivel`) REFERENCES `tb_niveis_de_acesso` (`nv_codigo`),
  ADD CONSTRAINT `fk_login` FOREIGN KEY (`fun_login`) REFERENCES `tb_login` (`lg_codigo`);

--
-- Limitadores para a tabela `tb_itens_pacote`
--
ALTER TABLE `tb_itens_pacote`
  ADD CONSTRAINT `fk_cod_pacote_it` FOREIGN KEY (`it_pacote`) REFERENCES `tb_pacote` (`pc_codigo`),
  ADD CONSTRAINT `fk_cod_servico_it` FOREIGN KEY (`it_servico`) REFERENCES `tb_servico` (`sv_codigo`);

--
-- Limitadores para a tabela `tb_servico`
--
ALTER TABLE `tb_servico`
  ADD CONSTRAINT `fk_categoria` FOREIGN KEY (`sv_categoria`) REFERENCES `tb_categorias` (`ctg_codigo`),
  ADD CONSTRAINT `fk_cod_fun_sv` FOREIGN KEY (`sv_funcionario`) REFERENCES `tb_funcionario` (`fun_codigo`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
