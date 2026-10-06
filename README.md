# 📊 Análise de Qualidade e Produção

Projeto de portfólio desenvolvido para praticar **SQL aplicado a dados de qualidade e produção**.

> **Importante:** todos os dados deste projeto são fictícios e foram criados exclusivamente para fins de estudo e portfólio.

## 🎯 Objetivo

Transformar dados de produção e inspeção em informações úteis para tomada de decisão.

O projeto simula um cenário industrial no qual é necessário acompanhar:

- volume produzido;
- quantidade aprovada e reprovada;
- taxa de reprovação;
- principais causas de defeito;
- desempenho por linha;
- desempenho por produto;
- evolução dos indicadores ao longo do tempo.

## 🛠️ Tecnologias

- **MySQL**
- **SQL**
- Modelagem relacional
- JOIN
- GROUP BY
- ORDER BY
- HAVING
- funções de agregação
- análise de indicadores

## 🗂️ Estrutura

```text
analise-qualidade-producao/
│
├── dados/
│   ├── produtos.csv
│   ├── producao.csv
│   └── inspecoes.csv
│
├── sql/
│   ├── 01_criacao_banco.sql
│   ├── 02_carga_dados.sql
│   └── 03_analise_qualidade.sql
│
└── README.md
```

## 🔎 Perguntas analisadas

1. Qual foi o volume total produzido?
2. Qual foi a taxa geral de reprovação?
3. Quais produtos apresentaram maior taxa de reprovação?
4. Quais foram as principais causas de reprovação?
5. Qual linha apresentou maior índice de reprovação?
6. Como a taxa de reprovação evoluiu mês a mês?
7. Quais ordens apresentaram maior quantidade de peças reprovadas?
8. Quais produtos ultrapassaram uma taxa de reprovação de 3%?

## 📈 Próximos passos

Este projeto pode evoluir para um dashboard no **Power BI**, conectando os indicadores de qualidade às análises realizadas em SQL.

Também pretendo ampliar o projeto com:

- indicadores de tendência;
- Pareto de causas;
- análise de não conformidades;
- visualização no Power BI;
- tratamento de dados com Python.

## 💡 Objetivo profissional

Este projeto representa minha transição para a área de **Dados**, aproveitando minha experiência profissional em **Qualidade e processos industriais**.

Meu objetivo é desenvolver soluções orientadas por dados para apoiar a identificação de problemas, acompanhamento de indicadores e melhoria contínua.
