-- create database psa (usando para criar o banco de dados)

-- criando tabelas (entidades) do banco de dados
use psa; -- supondo que o banco de dados já exite

CREATE TABLE `Agua_Potavel` (
  `ID_Agua` mediumint PRIMARY KEY AUTO_INCREMENT,
  `Volume` decimal(10,2) COMMENT 'Volume em litros.',
  `Data_de_Validade` date COMMENT 'Data de validade da embalagem.',
  `Nivel_de_Urgencia` tinyint COMMENT '1 - Baixa, 2 - Média, 3 - Alta',
  `Embalagem` varchar(50),
  `Descricao` text,
  `Fornecedor` varchar(100)
);

CREATE TABLE `Alimentos` (
  `ID_Alimentos` mediumint PRIMARY KEY AUTO_INCREMENT,
  `Nome` varchar(100),
  `Categoria` varchar(50),
  `Data_de_Validade` date COMMENT 'A data de validade do alimento.',
  `Quantidade` decimal(10,2) COMMENT 'Quantidade em quilogramas.',
  `Descricao` text,
  `Nivel_de_Urgencia` tinyint,
  `Fornecedor` varchar(100)
);

CREATE TABLE `Usuarios` (
  `ID_Usuarios` mediumint PRIMARY KEY AUTO_INCREMENT,
  `Nome_Usuarios` varchar(100),
  `Email` varchar(50) UNIQUE COMMENT 'Cada usuário deve ter um e-mail único.',
  `Endereco` varchar(225),
  `Tipo_de_Usuarios` varchar(50),
  `ID_Instituicao` mediumint
);

CREATE TABLE `Instituicao` (
  `ID_Instituicao` mediumint PRIMARY KEY AUTO_INCREMENT,
  `Nome_Instituicao` varchar(100),
  `Email` varchar(50),
  `Telefone` varchar(50),
  `Enderecos` varchar(225),
  `Descricao` text
);

CREATE TABLE `Voluntarios` (
  `ID_Voluntario` mediumint PRIMARY KEY AUTO_INCREMENT,
  `Nome_Voluntario` varchar(100),
  `Disponibilidade` timestamp,
  `Habilidades` text,
  `Email` varchar(50),
  `Telefone` varchar(50),
  `Descricao` text
);

CREATE TABLE `Moveis_e_Eletrodomesticos` (
  `ID_item` int PRIMARY KEY AUTO_INCREMENT,
  `Tipo_de_item` varchar(200),
  `Marca` varchar(100),
  `Modelo` varchar(100),
  `Estado_de_Conservacao` varchar(100),
  `Descricao` text
);

CREATE TABLE `Equipamentos_de_Comunicacao` (
  `ID_aparelho` int PRIMARY KEY AUTO_INCREMENT,
  `Tipo_de_equipamento` varchar(200),
  `Marca` varchar(100),
  `Modelo` varchar(100),
  `Data_de_aquisicao` date,
  `Descricao` text
);

CREATE TABLE `Materiais_de_Limpeza` (
  `ID` int PRIMARY KEY AUTO_INCREMENT,
  `Nome_item` varchar(225),
  `Quantidade` int,
  `Data_recebimento` date,
  `Data_validade` date,
  `Categoria` varchar(100),
  `Instrucoes_uso` text
);

CREATE TABLE `Roupas` (
  `ID_roupas` int PRIMARY KEY AUTO_INCREMENT,
  `Nome_da_peca` varchar(100),
  `Quantidade` int,
  `Categoria` varchar(100),
  `Estado_de_conservacao` varchar(100),
  `Etiqueta` enum('PP','P','M','G','GG'),
  `Tecidos` varchar(200),
  `Cor_da_peca` varchar(100),
  `Genero` enum('MASCULINO','FEMININO','UNISEX')
);

CREATE TABLE `Farmaceuticos` (
  `ID_Farmaceutico` int PRIMARY KEY AUTO_INCREMENT,
  `Nome_Comercial` varchar(100),
  `Tipo` enum('Medicamento','Suplemento','Homeopático'),
  `Data_de_Validade` date,
  `Quantidade_em_Estoque` decimal(10,2),
  `Instrucoes_de_Uso` text,
  `Nivel_de_Restricao` enum('Prescrição Necessária','Venda Livre'),
  `Fabricante` varchar(100),
  `Composicao` text,
  `Efeitos_Colaterais` text
);

CREATE TABLE `Materiais_de_Construcao` (
  `ID_Construcao` int PRIMARY KEY AUTO_INCREMENT,
  `Quantidade` int,
  `Peso` decimal,
  `Material` varchar(100),
  `Descricao` text
);

CREATE TABLE `Assistencia_Tecnica` (
  `ID_Assistencia` mediumint PRIMARY KEY AUTO_INCREMENT,
  `Nome_Tecnico` varchar(100),
  `Especialidade` varchar(100),
  `Disponibilidade` timestamp,
  `Contato` varchar(50),
  `Descricao` text,
  `Avaliacao` tinyint
);

CREATE TABLE `Doacao` (
  `ID_Doacao` mediumint PRIMARY KEY AUTO_INCREMENT,
  `UsuarioID` mediumint,
  `InstituicaoID` mediumint,
  `AguaID` mediumint,
  `AlimentoID` mediumint,
  `ItemID` int,
  `MaterialID` int,
  `AparelhoID` int,
  `RoupasID` int,
  `FarmaceuticoID` int,
  `ConstrucaoID` int,
  `Descricao` text
);

CREATE TABLE `Instituicao_Voluntarios` (
  `ID` mediumint PRIMARY KEY AUTO_INCREMENT,
  `ID_Instituicao` mediumint,
  `ID_Voluntario` mediumint
);

CREATE TABLE `Instituicao_Assistencia` (
  `ID` mediumint PRIMARY KEY AUTO_INCREMENT,
  `ID_Assistencia` mediumint,
  `ID_Instituicao` mediumint
);

CREATE TABLE `Usuario_Instituicao` (
  `ID` mediumint PRIMARY KEY AUTO_INCREMENT,
  `ID_Usuarios` mediumint,
  `ID_Instituicao` mediumint
);

CREATE UNIQUE INDEX `Usuarios_index_0` ON `Usuarios` (`Email`);

CREATE INDEX `Voluntarios_index_1` ON `Voluntarios` (`Nome_Voluntario`);

ALTER TABLE `Agua_Potavel` COMMENT = 'Tabela que armazena informações sobre água potável disponível para doação.';

ALTER TABLE `Alimentos` COMMENT = 'Tabela que armazena informações sobre alimentos disponíveis para doação.';

ALTER TABLE `Usuarios` COMMENT = 'Esta tabela armazena informações dos usuários registrados no sistema.';

ALTER TABLE `Instituicao` COMMENT = 'Tabela que armazena informações sobre a instituição.';

ALTER TABLE `Voluntarios` COMMENT = 'Tabela que armazena informações dos voluntários registrados no sistema.';

ALTER TABLE `Moveis_e_Eletrodomesticos` COMMENT = 'Tabela que armazena informações sobre móveis e eletrodomésticos disponíveis para doação.';

ALTER TABLE `Equipamentos_de_Comunicacao` COMMENT = 'Tabela que armazena informações sobre equipamentos de comunicação disponíveis para doação.';

ALTER TABLE `Materiais_de_Limpeza` COMMENT = 'Tabela que armazena informações sobre materiais de limpeza disponíveis para doação.';

ALTER TABLE `Roupas` COMMENT = 'Tabela que armazena informações sobre roupas disponíveis para doação.';

ALTER TABLE `Farmaceuticos` COMMENT = 'Tabela que armazena informações sobre produtos farmacêuticos disponíveis para doação.';

ALTER TABLE `Materiais_de_Construcao` COMMENT = 'Tabela que armazena informações sobre materiais de construção disponíveis para doação.';

ALTER TABLE `Assistencia_Tecnica` COMMENT = 'Tabela que armazena informações sobre assistência técnica disponível.';

ALTER TABLE `Doacao` COMMENT = 'Tabela que armazena informações sobre doações recebidas.';

ALTER TABLE `Instituicao_Voluntarios` COMMENT = 'Tabela de relação entre instituições e voluntários.';

ALTER TABLE `Instituicao_Assistencia` COMMENT = 'Tabela de relação entre instituições e pessoas que prestam assistencia tecnica.';

ALTER TABLE `Usuario_Instituicao` COMMENT = 'Tabela de relação entre usuários e instituições.';

ALTER TABLE `Doacao` ADD FOREIGN KEY (`UsuarioID`) REFERENCES `Usuarios` (`ID_Usuarios`);

ALTER TABLE `Doacao` ADD FOREIGN KEY (`InstituicaoID`) REFERENCES `Instituicao` (`ID_Instituicao`);

ALTER TABLE `Doacao` ADD FOREIGN KEY (`AguaID`) REFERENCES `Agua_Potavel` (`ID_Agua`);

ALTER TABLE `Doacao` ADD FOREIGN KEY (`AlimentoID`) REFERENCES `Alimentos` (`ID_Alimentos`);

ALTER TABLE `Doacao` ADD FOREIGN KEY (`RoupasID`) REFERENCES `Roupas` (`ID_roupas`);

ALTER TABLE `Doacao` ADD FOREIGN KEY (`ItemID`) REFERENCES `Moveis_e_Eletrodomesticos` (`ID_item`);

ALTER TABLE `Doacao` ADD FOREIGN KEY (`MaterialID`) REFERENCES `Materiais_de_Limpeza` (`ID`);

ALTER TABLE `Doacao` ADD FOREIGN KEY (`AparelhoID`) REFERENCES `Equipamentos_de_Comunicacao` (`ID_aparelho`);

ALTER TABLE `Doacao` ADD FOREIGN KEY (`FarmaceuticoID`) REFERENCES `Farmaceuticos` (`ID_Farmaceutico`);

ALTER TABLE `Doacao` ADD FOREIGN KEY (`ConstrucaoID`) REFERENCES `Materiais_de_Construcao` (`ID_Construcao`);

ALTER TABLE `usuario_instituicao` ADD FOREIGN KEY (`ID_Instituicao`) REFERENCES `instituicao` (`ID_Instituicao`);

ALTER TABLE `usuarios` ADD FOREIGN KEY (`ID_Instituicao`) REFERENCES `instituicao` (`ID_Instituicao`);

ALTER TABLE `Instituicao_Voluntarios` ADD FOREIGN KEY (`ID_Voluntario`) REFERENCES `Voluntarios` (`ID_Voluntario`);

ALTER TABLE `Usuario_Instituicao` ADD FOREIGN KEY (`ID_Usuarios`) REFERENCES `Usuarios` (`ID_Usuarios`);

ALTER TABLE `Instituicao_Voluntarios` ADD FOREIGN KEY (`ID_Instituicao`) REFERENCES `instituicao` (`ID_Instituicao`);

ALTER TABLE `Instituicao_Assistencia` ADD FOREIGN KEY (`ID_Instituicao`) REFERENCES `instituicao` (`ID_Instituicao`);

ALTER TABLE `Instituicao_Assistencia` ADD FOREIGN KEY (`ID_Assistencia`) REFERENCES `Assistencia_Tecnica` (`ID_Assistencia`);
