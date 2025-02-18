-- Geração de Modelo físico
-- Sql ANSI 2003 - brModelo.



CREATE TABLE Orcamento (
data_solicitacao DATETIME,
descricao VARCHAR(100),
valor DECIMAL(10,2),
id_orcamento VARCHAR(100) PRIMARY KEY
)

CREATE TABLE Destino (
id_destino VARCHAR(10) PRIMARY KEY,
pais VARCHAR(10),
descricao VARCHAR(50)
)

CREATE TABLE Pacote_Viagem (
data_inicio DATETIME,
data_fim DATETIME,
valor DECIMAL(10,2),
id_pacote VARCHAR(10) PRIMARY KEY,
duracao_dias INTEGER,
id_orcamento VARCHAR(10),
FOREIGN KEY(id_orcamento) REFERENCES Orcamento (id_orcamento) ON DELETE CASCADE
)

CREATE TABLE Agente (
id_agente VARCHAR(10) PRIMARY KEY,
nome VARCHAR(50),
email VARCHAR(20),
matricula VARCHAR(20),
telefone_agente VARCHAR(15)
)

CREATE TABLE Cliente (
id_cliente VARCHAR(10) PRIMARY KEY,
email VARCHAR(20),
nome VARCHAR(50),
endereço VARCHAR(10),
cpf VARCHAR(11),
telefone_cliente VARCHAR(15),
id_agente VARCHAR(10),
FOREIGN KEY(id_agente) REFERENCES Agente (id_agente)
)

CREATE TABLE solicitacao_orcamento (
id_orcamento VARCHAR(10),
id_cliente VARCHAR(10),
qtd_solicitcao INTEGER,
id_solicitacao VARCHAR(20) PRIMARY KEY,
FOREIGN KEY(id_orcamento) REFERENCES Orcamento (id_orcamento),
FOREIGN KEY(id_cliente) REFERENCES Cliente (id_cliente)
)

CREATE TABLE destino_pacote (
id_destino VARCHAR(10),
id_pacote VARCHAR(10),
cod_pacote_destino VARCHAR(50) PRIMARY KEY,
qtd_pacotes INTEGER,
FOREIGN KEY(id_destino) REFERENCES Destino (id_destino),
FOREIGN KEY(id_pacote) REFERENCES Pacote_Viagem (id_pacote)
)

CREATE TABLE realizacao_orcamento (
id_agente VARCHAR(10),
id_orcamento VARCHAR(10),
cod_orcamento VARCHAR(50) PRIMARY KEY,
FOREIGN KEY(id_agente) REFERENCES Agente (id_agente),
FOREIGN KEY(id_orcamento) REFERENCES Orcamento (id_orcamento)
)

