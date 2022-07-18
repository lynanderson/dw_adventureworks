{{ config(
       materialized='table',
       tags=["pedido"]
) }}

WITH fct_pedido_venda AS (
    SELECT
        *
    FROM {{ ref('fct_pedido_venda') }}
),

dim_cliente AS (
    SELECT
        *
    FROM {{ ref('dim_cliente') }}
),

dim_vendedor AS (
    SELECT
        *
    FROM {{ ref('dim_vendedor') }}
),

dim_cidade AS (
    SELECT
        *
    FROM {{ ref('dim_cidade') }}
),

dim_estado AS (
    SELECT
        *
    FROM {{ ref('dim_estado') }}
),

dim_pais AS (
    SELECT
        *
    FROM {{ ref('dim_pais') }}
),

dim_produto AS (
    SELECT
        *
    FROM {{ ref('dim_produto') }}
),

dim_motivo_venda AS (
    SELECT
        *
    FROM {{ ref('dim_motivo_venda') }}
)

SELECT
         fct_pedido_venda.codigo_pedido
       , fct_pedido_venda.numero_revisao
       , fct_pedido_venda.data_emissao
       , fct_pedido_venda.data_vencimento
       , fct_pedido_venda.data_entrega
       , fct_pedido_venda.status_pedido
       , fct_pedido_venda.numero_pedido_compra
       , fct_pedido_venda.numero_conta
       , fct_pedido_venda.taxa_cambio
       , fct_pedido_venda.valor_total_liquido
       , fct_pedido_venda.total_taxa
       , fct_pedido_venda.carga
       , fct_pedido_venda.valor_total_bruto
       , fct_pedido_venda.codigo_pedido_item
       , fct_pedido_venda.numero_rastreamento
       , fct_pedido_venda.qtde_pedida
       , fct_pedido_venda.codigo_produto
       , dim_produto.descricao_produto
       , dim_produto.codigo_barra
       , dim_produto.cor
       , dim_produto.estoque_seguranca
       , dim_produto.ponto_pedido
       , dim_produto.custo_padrao
       , dim_produto.preco_tabela
       , dim_produto.dimensao_produto
       , dim_produto.dimensao_unidade_medida
       , dim_produto.peso_produto
       , dim_produto.peso_unidade_medida
       , dim_produto.dias_para_fabricar
       , dim_produto.linha_produto
       , dim_produto.classe_produto
       , dim_produto.estilo_produto
       , dim_produto.codigo_categoria
       , dim_produto.descricao_categoria
       , dim_produto.codigo_subcategoria
       , dim_produto.descricao_subcategoria
       , dim_produto.inicio_venda
       , dim_produto.fim_venda
       , dim_produto.data_descontinuacao
       , fct_pedido_venda.preco_unitario
       , fct_pedido_venda.desconto_unitario
       , dim_cliente.titulo_cliente
       , dim_cliente.codigo_cliente
       , dim_cliente.nome_cliente
       , dim_cliente.sobrenome_cliente
       , dim_cliente.sufixo_cliente
       , dim_cliente.tipo_cartao
       , dim_cliente.numero_cartao
       , dim_cliente.mes_de_validade
       , dim_cliente.ano_de_validade
       , CASE WHEN dim_vendedor.nome_vendedor IS NULL THEN 'Sem Vendedor'
              ELSE dim_vendedor.nome_vendedor
         END AS nome_vendedor
       , dim_vendedor.sobrenome_vendedor
       , dim_vendedor.titulo_vendedor
       , dim_vendedor.sufixo_vendedor
       , dim_vendedor.email_promocional
       , dim_vendedor.codigo_nacionalidade
       , dim_vendedor.usuario
       , dim_vendedor.cargo
       , dim_vendedor.data_nascimento
       , dim_vendedor.estado_civil
       , dim_vendedor.sexo
       , dim_vendedor.data_contratacao
       , dim_vendedor.hora_extra
       , dim_vendedor.hora_licenca_medica
       , dim_vendedor.meta
       , dim_vendedor.bonificacao
       , dim_vendedor.comissao
       , dim_vendedor.venda_total
       , dim_vendedor.venda_total_ano_passado
       , cidade_entrega.endereco AS endereco_entrega
       , cidade_entrega.endereco_complemento AS complemento_endereco_entrega
       , cidade_entrega.nome_cidade AS nome_cidade_entrega
       , cidade_entrega.codigo_estado AS codigo_estado_entrega
       , cidade_entrega.cep AS cep_entrega
       , estado_entrega.sigla_estado AS sigla_estado_entrega
       , estado_entrega.nome_estado AS nome_estado_entrega
       , pais_entrega.sigla_pais AS sigla_pais_entrega
       , pais_entrega.nome_pais AS nome_pais_entrega
       , cidade_cliente.codigo_cidade AS codigo_cidade_cliente
       , cidade_cliente.endereco AS endereco_cliente
       , cidade_cliente.endereco_complemento AS complemento_endereco_cliente
       , cidade_cliente.nome_cidade AS nome_cidade_cliente
       , cidade_cliente.codigo_estado AS codigo_estado_cliente
       , cidade_cliente.cep AS cep_cliente
       , estado_cliente.sigla_estado AS sigla_estado_cliente
       , estado_cliente.nome_estado AS nome_estado_cliente
       , pais_cliente.sigla_pais AS sigla_pais_cliente
       , pais_cliente.nome_pais AS nome_pais_cliente
       , CASE WHEN dim_motivo_venda.descricao_motivo IS NULL THEN 'Indefinido'
              ELSE dim_motivo_venda.descricao_motivo
         END AS descricao_motivo
       , CASE WHEN dim_motivo_venda.tipo_motivo IS NULL THEN 'Indefinido'
              ELSE dim_motivo_venda.tipo_motivo
         END AS tipo_motivo
FROM fct_pedido_venda
LEFT JOIN dim_cliente
    ON dim_cliente.codigo_cliente = fct_pedido_venda.codigo_cliente
LEFT JOIN dim_vendedor
    ON dim_vendedor.codigo_empresa = fct_pedido_venda.codigo_vendedor
LEFT JOIN dim_cidade cidade_entrega
    ON cidade_entrega.codigo_cidade = fct_pedido_venda.codigo_endereco_entrega
LEFT JOIN dim_estado estado_entrega
    ON estado_entrega.codigo_estado = cidade_entrega.codigo_estado
LEFT JOIN dim_pais pais_entrega
    ON pais_entrega.sigla_pais = estado_entrega.sigla_pais
LEFT JOIN dim_cidade cidade_cliente
    ON cidade_cliente.codigo_cidade = fct_pedido_venda.codigo_cidade
LEFT JOIN dim_estado estado_cliente
    ON estado_cliente.codigo_estado = cidade_cliente.codigo_estado
LEFT JOIN dim_pais pais_cliente
    ON pais_cliente.sigla_pais = estado_cliente.sigla_pais
LEFT JOIN dim_produto
    ON dim_produto.codigo_produto = fct_pedido_venda.codigo_produto
LEFT JOIN dim_motivo_venda
    ON dim_motivo_venda.codigo_motivo = fct_pedido_venda.codigo_motivo
GROUP BY
         fct_pedido_venda.codigo_pedido
       , fct_pedido_venda.numero_revisao
       , fct_pedido_venda.data_emissao
       , fct_pedido_venda.data_vencimento
       , fct_pedido_venda.data_entrega
       , fct_pedido_venda.status_pedido
       , fct_pedido_venda.numero_pedido_compra
       , fct_pedido_venda.numero_conta
       , fct_pedido_venda.taxa_cambio
       , fct_pedido_venda.valor_total_liquido
       , fct_pedido_venda.total_taxa
       , fct_pedido_venda.carga
       , fct_pedido_venda.valor_total_bruto
       , fct_pedido_venda.codigo_pedido_item
       , fct_pedido_venda.numero_rastreamento
       , fct_pedido_venda.qtde_pedida
       , fct_pedido_venda.codigo_produto
       , dim_produto.descricao_produto
       , dim_produto.codigo_barra
       , dim_produto.cor
       , dim_produto.estoque_seguranca
       , dim_produto.ponto_pedido
       , dim_produto.custo_padrao
       , dim_produto.preco_tabela
       , dim_produto.dimensao_produto
       , dim_produto.dimensao_unidade_medida
       , dim_produto.peso_produto
       , dim_produto.peso_unidade_medida
       , dim_produto.dias_para_fabricar
       , dim_produto.linha_produto
       , dim_produto.classe_produto
       , dim_produto.estilo_produto
       , dim_produto.codigo_categoria
       , dim_produto.descricao_categoria
       , dim_produto.codigo_subcategoria
       , dim_produto.descricao_subcategoria
       , dim_produto.inicio_venda
       , dim_produto.fim_venda
       , dim_produto.data_descontinuacao
       , fct_pedido_venda.preco_unitario
       , fct_pedido_venda.desconto_unitario
       , dim_cliente.titulo_cliente
       , dim_cliente.codigo_cliente
       , dim_cliente.nome_cliente
       , dim_cliente.sobrenome_cliente
       , dim_cliente.sufixo_cliente
       , dim_cliente.tipo_cartao
       , dim_cliente.numero_cartao
       , dim_cliente.mes_de_validade
       , dim_cliente.ano_de_validade
       , dim_vendedor.nome_vendedor
       , dim_vendedor.sobrenome_vendedor
       , dim_vendedor.titulo_vendedor
       , dim_vendedor.sufixo_vendedor
       , dim_vendedor.email_promocional
       , dim_vendedor.codigo_nacionalidade
       , dim_vendedor.usuario
       , dim_vendedor.cargo
       , dim_vendedor.data_nascimento
       , dim_vendedor.estado_civil
       , dim_vendedor.sexo
       , dim_vendedor.data_contratacao
       , dim_vendedor.hora_extra
       , dim_vendedor.hora_licenca_medica
       , dim_vendedor.meta
       , dim_vendedor.bonificacao
       , dim_vendedor.comissao
       , dim_vendedor.venda_total
       , dim_vendedor.venda_total_ano_passado
       , cidade_entrega.endereco
       , cidade_entrega.endereco_complemento
       , cidade_entrega.nome_cidade
       , cidade_entrega.codigo_estado
       , cidade_entrega.cep
       , estado_entrega.sigla_estado
       , estado_entrega.nome_estado
       , pais_entrega.sigla_pais
       , pais_entrega.nome_pais
       , cidade_cliente.codigo_cidade
       , cidade_cliente.endereco
       , cidade_cliente.endereco_complemento
       , cidade_cliente.nome_cidade
       , cidade_cliente.codigo_estado
       , cidade_cliente.cep
       , estado_cliente.sigla_estado
       , estado_cliente.nome_estado
       , pais_cliente.sigla_pais
       , pais_cliente.nome_pais
       , dim_motivo_venda.descricao_motivo
       , dim_motivo_venda.tipo_motivo



 