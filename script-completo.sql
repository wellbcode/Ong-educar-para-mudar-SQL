
CREATE DATABASE ong_educar;
USE ong_educar;


CREATE TABLE voluntario (
    id_voluntario INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(120) NOT NULL,
    email VARCHAR(120) NOT NULL UNIQUE,
    telefone VARCHAR(20),
    data_entrada DATE NOT NULL
);


CREATE TABLE projeto (
    id_projeto INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(150) NOT NULL,
    descricao TEXT,
    status ENUM('ativo','inativo') DEFAULT 'ativo'
);


CREATE TABLE beneficiario (
    id_beneficiario INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(120) NOT NULL,
    idade INT,
    endereco VARCHAR(200),
    data_cadastro DATE NOT NULL
);


CREATE TABLE atividade (
    id_atividade INT AUTO_INCREMENT PRIMARY KEY,
    titulo VARCHAR(150) NOT NULL,
    descricao TEXT,
    data DATE NOT NULL,
    id_projeto INT NOT NULL,
    FOREIGN KEY (id_projeto) REFERENCES projeto(id_projeto)
);


CREATE TABLE voluntario_atividade (
    id_voluntario INT NOT NULL,
    id_atividade INT NOT NULL,
    PRIMARY KEY (id_voluntario, id_atividade),
    FOREIGN KEY (id_voluntario) REFERENCES voluntario(id_voluntario),
    FOREIGN KEY (id_atividade) REFERENCES atividade(id_atividade)
);


CREATE TABLE beneficiario_participacao (
    id_beneficiario INT NOT NULL,
    id_atividade INT NOT NULL,
    presenca ENUM('sim','não') DEFAULT 'sim',
    PRIMARY KEY (id_beneficiario, id_atividade),
    FOREIGN KEY (id_beneficiario) REFERENCES beneficiario(id_beneficiario),
    FOREIGN KEY (id_atividade) REFERENCES atividade(id_atividade)
);


INSERT INTO voluntario (nome, email, telefone, data_entrada) VALUES
('Ana Souza', 'ana@ong.org', '1199999-1111', '2024-01-10'),
('Carlos Lima', 'carlos@ong.org', '1198888-2222', '2023-11-20'),
('Fernanda Silva', 'fer@ong.org', '1197777-3333', '2024-02-02');

INSERT INTO projeto (nome, descricao, status) VALUES
('Educar para Mudar', 'Projeto de reforço escolar para jovens', 'ativo'),
('Cidadania em Ação', 'Atividades de conscientização social', 'ativo');

INSERT INTO beneficiario (nome, idade, endereco, data_cadastro) VALUES
('João Pedro', 14, 'Rua A, 123', '2024-01-05'),
('Maria Luiza', 16, 'Rua B, 456', '2024-01-15'),
('Rafael Santos', 15, 'Rua C, 789', '2024-02-01');

INSERT INTO atividade (titulo, descricao, data, id_projeto) VALUES
('Aula de Matemática', 'Reforço escolar para alunos do fundamental', '2024-02-10', 1),
('Oficina de Direitos Humanos', 'Discussão sobre direitos básicos', '2024-02-20', 2);

INSERT INTO voluntario_atividade VALUES
(1, 1),
(2, 1),
(3, 2);

INSERT INTO beneficiario_participacao VALUES
(1, 1, 'sim'),
(2, 1, 'sim'),
(3, 2, 'não');



SELECT b.nome, a.titulo
FROM beneficiario b
JOIN beneficiario_participacao p ON p.id_beneficiario = b.id_beneficiario
JOIN atividade a ON a.id_atividade = p.id_atividade
WHERE a.id_atividade = 1;


SELECT v.nome, a.titulo
FROM voluntario v
JOIN voluntario_atividade va ON va.id_voluntario = v.id_voluntario
JOIN atividade a ON a.id_atividade = va.id_atividade;


SELECT * FROM projeto WHERE status = 'ativo';


SELECT nome, idade
FROM beneficiario
ORDER BY idade DESC;


SELECT nome, email
FROM voluntario
LIMIT 2;


UPDATE voluntario
SET telefone = '1193333-0000'
WHERE id_voluntario = 1;

UPDATE beneficiario
SET endereco = 'Rua Atualizada, 999'
WHERE id_beneficiario = 3;

UPDATE projeto
SET status = 'inativo'
WHERE id_projeto = 2;


DELETE FROM beneficiario_participacao
WHERE id_beneficiario = 3 AND id_atividade = 2;

DELETE FROM voluntario_atividade
WHERE id_voluntario = 2 AND id_atividade = 1;

DELETE FROM beneficiario
WHERE id_beneficiario = 2;