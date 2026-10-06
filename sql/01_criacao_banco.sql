-- Projeto: Análise de Qualidade e Produção
-- Banco: MySQL
-- Todos os dados deste projeto são fictícios.

CREATE DATABASE IF NOT EXISTS portfolio_qualidade;
USE portfolio_qualidade;

DROP TABLE IF EXISTS inspecoes;
DROP TABLE IF EXISTS producao;
DROP TABLE IF EXISTS produtos;

CREATE TABLE produtos (
    id_produto INT PRIMARY KEY,
    produto VARCHAR(100) NOT NULL,
    categoria VARCHAR(50) NOT NULL
);

CREATE TABLE producao (
    id_ordem INT PRIMARY KEY,
    data_producao DATE NOT NULL,
    id_produto INT NOT NULL,
    linha VARCHAR(30) NOT NULL,
    quantidade_produzida INT NOT NULL,
    quantidade_aprovada INT NOT NULL,
    quantidade_reprovada INT NOT NULL,
    FOREIGN KEY (id_produto) REFERENCES produtos(id_produto)
);

CREATE TABLE inspecoes (
    id_ordem INT PRIMARY KEY,
    resultado VARCHAR(20) NOT NULL,
    causa_principal VARCHAR(50) NOT NULL,
    inspetor VARCHAR(50) NOT NULL,
    FOREIGN KEY (id_ordem) REFERENCES producao(id_ordem)
);
