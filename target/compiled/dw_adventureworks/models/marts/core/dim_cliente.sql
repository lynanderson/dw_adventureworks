

WITH stg_cliente AS (
    SELECT
    *
    FROM `dw-adventureworks-354222`.`dbt_lynanderson`.`stg_cliente`
),

stg_pessoa AS (
    SELECT
    *
    FROM `dw-adventureworks-354222`.`dbt_lynanderson`.`stg_pessoa`
),

stg_empresa AS (
    SELECT
    *
    FROM `dw-adventureworks-354222`.`dbt_lynanderson`.`stg_empresa`
),

stg_empresa_endereco AS (
    SELECT
    *
    FROM `dw-adventureworks-354222`.`dbt_lynanderson`.`stg_empresa_endereco`
),

stg_cartao_credito_pessoa AS (
    SELECT
    *
    FROM `dw-adventureworks-354222`.`dbt_lynanderson`.`stg_cartao_credito_pessoa`
),

stg_cartao_credito AS (
    SELECT
    *
    FROM `dw-adventureworks-354222`.`dbt_lynanderson`.`stg_cartao_credito`
)

SELECT
         stg_cliente.codigo_cliente
       , stg_pessoa.codigo_empresa
       , stg_pessoa.titulo AS titulo_cliente
       , stg_pessoa.nome AS nome_cliente
       , stg_pessoa.sobrenome AS sobrenome_cliente
       , stg_pessoa.sufixo AS sufixo_cliente
       , stg_empresa_endereco.codigo_cidade
       , stg_cartao_credito_pessoa.codigo_cartao_credito
       , CASE WHEN stg_cartao_credito.tipo_cartao IS NULL THEN 'Indefinido'
              ELSE stg_cartao_credito.tipo_cartao
         END AS tipo_cartao
       , stg_cartao_credito.numero_cartao
       , stg_cartao_credito.mes_de_validade
       , stg_cartao_credito.ano_de_validade
       , stg_cliente.data_modificacao
FROM stg_cliente
JOIN stg_pessoa
    ON stg_pessoa.codigo_empresa = stg_cliente.codigo_pessoa
LEFT JOIN stg_empresa
    ON stg_pessoa.codigo_empresa = stg_empresa.codigo_empresa
LEFT JOIN stg_empresa_endereco
    ON stg_empresa.codigo_empresa = stg_empresa_endereco.codigo_empresa
LEFT JOIN stg_cartao_credito_pessoa
    ON stg_cartao_credito_pessoa.codigo_empresa = stg_pessoa.codigo_empresa
LEFT JOIN stg_cartao_credito
    ON stg_cartao_credito.codigo_cartao_credito = stg_cartao_credito_pessoa.codigo_cartao_credito