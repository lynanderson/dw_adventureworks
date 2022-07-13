

WITH stg_pessoa AS (
    SELECT
    *
    FROM `dw-adventureworks-354222`.`dbt_lynanderson`.`stg_pessoa`
),

stg_funcionario AS (
    SELECT
    *
    FROM `dw-adventureworks-354222`.`dbt_lynanderson`.`stg_funcionario`
),

stg_vendedor AS (
    SELECT
    *
    FROM `dw-adventureworks-354222`.`dbt_lynanderson`.`stg_vendedor`
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
)

SELECT
         stg_pessoa.codigo_empresa
       , stg_pessoa.tipo_pessoa
       , stg_pessoa.titulo AS titulo_vendedor
       , stg_pessoa.nome AS nome_vendedor
       , stg_pessoa.sobrenome AS sobrenome_vendedor
       , stg_pessoa.sufixo AS sufixo_vendedor
       , stg_pessoa.email_promocional
       , stg_pessoa.data_modificacao
       , stg_funcionario.codigo_nacionalidade
       , stg_funcionario.usuario
       , stg_funcionario.cargo
       , stg_funcionario.data_nascimento
       , stg_funcionario.estado_civil
       , stg_funcionario.sexo
       , stg_funcionario.data_contratacao
       , stg_funcionario.hora_extra
       , stg_funcionario.hora_licenca_medica
       , stg_vendedor.codigo_territorio
       , stg_vendedor.meta
       , stg_vendedor.bonificacao
       , stg_vendedor.comissao
       , stg_vendedor.venda_total
       , stg_vendedor.venda_total_ano_passado
       , stg_empresa_endereco.codigo_cidade
FROM stg_pessoa
JOIN stg_funcionario
    ON stg_funcionario.codigo_empresa = stg_pessoa.codigo_empresa
JOIN stg_vendedor
    ON stg_vendedor.codigo_empresa = stg_funcionario.codigo_empresa
LEFT JOIN stg_empresa
    ON stg_empresa.codigo_empresa = stg_pessoa.codigo_empresa
LEFT JOIN stg_empresa_endereco
    ON stg_empresa_endereco.codigo_empresa = stg_empresa.codigo_empresa