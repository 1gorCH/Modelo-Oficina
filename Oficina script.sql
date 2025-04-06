CREATE DATABASE oficina;
use oficina;

CREATE TABLE clientes (
    idCliente INT PRIMARY KEY AUTO_INCREMENT,
    Fname VARCHAR(50) NOT NULL,
    Lname VARCHAR(50) NOT NULL,
    Contato CHAR(11) NOT NULL,
    Endereco VARCHAR(50),
    Tipo ENUM('CPF', 'CNPJ') NOT NULL,
    Documento VARCHAR(14) UNIQUE NOT NULL
);

CREATE TABLE ordemServico(
     idOS INT PRIMARY KEY AUTO_INCREMENT,
     DataEmissao DATE NOT NULL,
     ValorTotal DECIMAL(8,2) NOT NULL,
     StatusOS ENUM('Na espera', 'Incompleto', 'Em andamento', 'Completo') DEFAULT 'Incompleto',
     DataEntrega DATE,
     MaoObra DECIMAL(8,2) NOT NULL
);

CREATE TABLE servico(
     idSCliente INT,
     idSOS INT,
     TipoServico VARCHAR(45),
     ModeloVeiculo VARCHAR(45),
     PRIMARY KEY (idSCliente, idSOS),
     CONSTRAINT fk_servico_cliente FOREIGN KEY (idSCliente) REFERENCES clientes(idCliente),
     CONSTRAINT fk_servico_os FOREIGN KEY (idSOS) REFERENCES ordemServico(idOS)
);

CREATE TABLE mecanicos(
    idMecanico INT PRIMARY KEY AUTO_INCREMENT,
    FnameM VARCHAR(50) NOT NULL,
    LnameM VARCHAR(50) NOT NULL,
    EnderecoM VARCHAR(50),
    Especialidade ENUM('Geral', 'Eletricista', 'Alinhador') DEFAULT 'Geral',
    StatusM ENUM('Ativo', 'Inativo') DEFAULT 'Ativo',
    Salario DECIMAL(10,2),
    Turno ENUM('Manhã', 'Tarde', 'Noite', 'Integral') DEFAULT 'Integral'
);

CREATE TABLE pecas(
   idPecas INT PRIMARY KEY AUTO_INCREMENT,
   CodigoConversao VARCHAR(15) UNIQUE,
   Nome VARCHAR(50),
   Especificacoes VARCHAR(50),
   Preco DECIMAL(8,2),
   Estoque INT
);

CREATE TABLE equipeMecanicos(
   idEMecanico INT,
   idEOS INT,
   Funcao ENUM('Líder','Auxiliar') DEFAULT 'Auxiliar',
   HorasTrabalhadas DECIMAL(5,2),
   PRIMARY KEY (idEMecanico, idEOS),
   CONSTRAINT fk_equipe_mecanico FOREIGN KEY (idEMecanico) REFERENCES mecanicos(idMecanico),
   CONSTRAINT fk_equipe_os FOREIGN KEY (idEOS) REFERENCES ordemServico(idOS)
);

CREATE TABLE pecasUsadas(
   idPUPecas INT,
   idPUOS INT,
   Quantidade INT NOT NULL,
   PRIMARY KEY (idPUPecas, idPUOS),
   CONSTRAINT fk_pecas_usadas_pecas FOREIGN KEY (idPUPecas) REFERENCES pecas(idPecas),
   CONSTRAINT fk_pecas_usadas_os FOREIGN KEY (idPUOS) REFERENCES ordemServico(idOS)
);