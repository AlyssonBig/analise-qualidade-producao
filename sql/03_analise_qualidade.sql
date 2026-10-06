-- Projeto: Análise de Qualidade e Produção
-- Objetivo: praticar SQL aplicado a indicadores de qualidade.
-- Banco: MySQL

USE portfolio_qualidade;

-- 1. Visão geral da produção
SELECT
    SUM(quantidade_produzida) AS total_produzido,
    SUM(quantidade_aprovada) AS total_aprovado,
    SUM(quantidade_reprovada) AS total_reprovado
FROM producao;

-- 2. Taxa de reprovação geral
SELECT
    ROUND(SUM(quantidade_reprovada) / SUM(quantidade_produzida) * 100, 2) AS taxa_reprovacao_pct
FROM producao;

-- 3. Produção e reprovação por produto
SELECT
    pr.produto,
    SUM(p.quantidade_produzida) AS produzido,
    SUM(p.quantidade_reprovada) AS reprovado,
    ROUND(SUM(p.quantidade_reprovada) / SUM(p.quantidade_produzida) * 100, 2) AS taxa_reprovacao_pct
FROM producao p
JOIN produtos pr ON pr.id_produto = p.id_produto
GROUP BY pr.produto
ORDER BY taxa_reprovacao_pct DESC;

-- 4. Principais causas de reprovação
SELECT
    i.causa_principal,
    COUNT(*) AS ocorrencias
FROM inspecoes i
WHERE i.resultado = 'Reprovado'
GROUP BY i.causa_principal
ORDER BY ocorrencias DESC;

-- 5. Indicadores por linha
SELECT
    linha,
    SUM(quantidade_produzida) AS produzido,
    SUM(quantidade_reprovada) AS reprovado,
    ROUND(SUM(quantidade_reprovada) / SUM(quantidade_produzida) * 100, 2) AS taxa_reprovacao_pct
FROM producao
GROUP BY linha
ORDER BY taxa_reprovacao_pct DESC;

-- 6. Evolução mensal
SELECT
    DATE_FORMAT(data_producao, '%Y-%m') AS mes,
    SUM(quantidade_produzida) AS produzido,
    SUM(quantidade_reprovada) AS reprovado,
    ROUND(SUM(quantidade_reprovada) / SUM(quantidade_produzida) * 100, 2) AS taxa_reprovacao_pct
FROM producao
GROUP BY DATE_FORMAT(data_producao, '%Y-%m')
ORDER BY mes;

-- 7. Ordens com reprovação
SELECT
    p.id_ordem,
    p.data_producao,
    pr.produto,
    p.linha,
    p.quantidade_reprovada,
    i.causa_principal
FROM producao p
JOIN produtos pr ON pr.id_produto = p.id_produto
JOIN inspecoes i ON i.id_ordem = p.id_ordem
WHERE p.quantidade_reprovada > 0
ORDER BY p.quantidade_reprovada DESC;

-- 8. Exemplo de análise com condição de negócio:
-- produtos com taxa de reprovação acima de 3%
SELECT
    pr.produto,
    ROUND(SUM(p.quantidade_reprovada) / SUM(p.quantidade_produzida) * 100, 2) AS taxa_reprovacao_pct
FROM producao p
JOIN produtos pr ON pr.id_produto = p.id_produto
GROUP BY pr.produto
HAVING taxa_reprovacao_pct > 3
ORDER BY taxa_reprovacao_pct DESC;
