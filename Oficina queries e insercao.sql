use oficina;

-- Inserindo valores na tabela clientes
INSERT INTO clientes (Fname, Lname, Contato, Endereco, Tipo, Documento)
	   VALUES ('Luan','Santana', '61945678987','Rua da taboquinha - Brasilia','CPF', 65478912354),
              ('Maria','Abreu', '61985554567','27 de Novembro - Brasilia','CPF', 12345678949),
              ('Carlos','Chaves', '61998765459','27 de Novembro - Brasilia','CPF', 65485296347),
              ('Fernando','Silva', '21945678987','Alexandre Pires - Brasilia','CPF', 74185296378);

-- Inserindo valores na tabela Ordem de Servico
INSERT INTO ordemServico (DataEmissao, ValorTotal, StatusOS, DataEntrega, MaoObra)
       VALUES ('2025-03-06', 350.00, 'Em andamento', '2025-03-10', 50.00),
              ('2025-03-08', 1450.15, 'Completo', '2025-03-08', 200.00),
              ('2025-03-08', 500.00, 'Completo', '2025-03-08', 100.00);

-- Inserindo valores na tabela Servicos
INSERT INTO servico(idSCliente, idSOS, TipoServico, ModeloVeiculo)
      VALUES (1, 1, 'Troca de Oleo', 'Peugeot 905'),
             (3, 2, 'Revisão Geral', 'Gol G5'),
             (2, 3, 'Troca do Eixo Traseiro', 'HB20');

-- Inserindo valores na tabela Mecânicos
INSERT INTO mecanicos(FnameM, LnameM, EnderecoM, Especialidade, StatusM, Salario, Turno)
	  VALUES('Carlos', 'Silva', 'Rua das Flores, 123', 'Geral', 'Ativo', 3000.00, 'Manhã'),
            ('Marcos', 'Oliveira', 'Av. Brasil, 456', 'Eletricista', 'Ativo', 3500.50, 'Integral'),
            ('João', 'Santos', 'Rua A, 789', 'Alinhador', 'Inativo', 2800.75, 'Tarde'),
			('Paulo', 'Ferreira', 'Travessa B, 321', 'Geral', 'Ativo', 3200.00, 'Noite'),
            ('Ricardo', 'Mendes', 'Av. Central, 222', 'Eletricista', 'Ativo', 4000.00, 'Integral');

-- Inserindo valores na tabela Peças
INSERT INTO pecas(CodigoConversao, Nome, Especificacoes, Preco, Estoque)
     VALUES('540W', '5W40 Mobil', 'Carros acima de 5000km', 48.00, 248),
           ('PSL55', 'Filtro Oleo', 'Fiat, Nissan e Honda.', 25.00, 55),
           ('ARL4075', 'Filtro Ar', 'Fiat, Nissan e Honda.', 83.00, 14),
           
           ('HF87A', 'Disco Freio', 'Gol G5', 102.00, 8),
           ('SYL1419 ', 'Pastilha Freio', 'Gol G5, Saveiro, Voyage', 45.00, 25),
           ('HF65A', 'Tambor Traseiro', 'Gol 1.0, Gol G5, Gol G6', 303.00, 5),
           ('DOT4', 'Oleo Freio', 'Universal', 24.00, 105),
           ('456789', 'Parachoque Dianteiro Gol G5', 'Universal', 776.00, 1),
           
           
           ('COH11010', 'Coifa Homocinética', 'Hyundai.', 40.00, 6),
           ('34440', 'Bucha Eixo-Traseiro', 'Hyundai', 65.00, 15),
           ('35456788', 'Eixo-Traseiro', 'Hyundai', 295, 4);

-- Inserindo valores na tabela Equipe de Mecanicos
INSERT INTO equipeMecanicos(idEMecanico, idEOS, Funcao, HorasTrabalhadas)
    VALUES (1, 2, 'Líder', 5.5),
           (2, 1, 'Líder', 1.0),
           (3, 3, 'Líder', 3.5),
           (4, 2, 'Auxiliar', 5.5),
           (5, 2, 'Auxiliar', 5.5);

-- Inserindo valores na tabela de Peças usadas na O.S
INSERT INTO pecasUsadas(idPUPecas, idPUOS, Quantidade)
    VALUES (1,1,4),
		   (2,1,1),
           (3,1,1),
           
           (4,2,2),
           (5,2,4),
           (6,2,2),
           (7,2,4),
           (8,2,1),
           
           (9,3,1),
           (10,3,1),
           (11,3,1);
           
-- Consultaando todos os clientes que possuem O.S na oficina
SELECT concat(Fname, ' ', Lname) as NomeCompleto, Contato, ModeloVeiculo, TipoServico, idSOS as NumeroOS from clientes c, servico
          where c.idCliente = idSCliente;

-- Consultando todas as Ordem de serviços com o status para analise
SELECT c.idCliente, c.Fname, o.idOS, s.ModeloVeiculo, s.TipoServico, o.StatusOS
		  FROM clientes c
          INNER JOIN servico s ON c.idCliente = s.idSCliente
		  INNER JOIN ordemServico o ON s.idSOS = o.idOS;