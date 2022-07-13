

WITH stg_capa_pedido_venda AS (
    SELECT
        *
    FROM `dw-adventureworks-354222`.`dbt_lynanderson`.`stg_capa_pedido_venda`
),

stg_item_pedido_venda AS (
    SELECT
        *
    FROM `dw-adventureworks-354222`.`dbt_lynanderson`.`stg_item_pedido_venda`
),

stg_capa_pedido_venda_motivo AS (
    SELECT
        *
    FROM `dw-adventureworks-354222`.`dbt_lynanderson`.`stg_capa_pedido_venda_motivo`
)

SELECT
         stg_capa_pedido_venda.codigo_pedido
       , stg_capa_pedido_venda.numero_revisao
       , stg_capa_pedido_venda.data_emissao
       , stg_capa_pedido_venda.data_vencimento
       , stg_capa_pedido_venda.data_entrega
       , stg_capa_pedido_venda.status_pedido
       , stg_capa_pedido_venda.numero_pedido_compra
       , stg_capa_pedido_venda.numero_conta
       , stg_capa_pedido_venda.codigo_cliente
       , stg_capa_pedido_venda.codigo_vendedor
       , stg_capa_pedido_venda.codigo_territorio
       , stg_capa_pedido_venda.codigo_cidade
       , stg_capa_pedido_venda.codigo_endereco_entrega
       , stg_capa_pedido_venda.codigo_modo_entrega
       , stg_capa_pedido_venda.codigo_cartao_credito
       , stg_capa_pedido_venda.codigo_aprovacao_cartao
       , stg_capa_pedido_venda.taxa_cambio
       , stg_capa_pedido_venda.valor_total_liquido
       , stg_capa_pedido_venda.total_taxa
       , stg_capa_pedido_venda.carga
       , stg_capa_pedido_venda.valor_total_bruto
       , stg_item_pedido_venda.codigo_pedido_item
       , stg_item_pedido_venda.numero_rastreamento
       , stg_item_pedido_venda.qtde_pedida
       , stg_item_pedido_venda.codigo_produto
       , stg_item_pedido_venda.codigo_oferta_especial
       , stg_item_pedido_venda.preco_unitario
       , stg_item_pedido_venda.desconto_unitario
       , stg_capa_pedido_venda_motivo.codigo_motivo
FROM stg_capa_pedido_venda
JOIN stg_item_pedido_venda
    ON stg_item_pedido_venda.codigo_pedido = stg_capa_pedido_venda.codigo_pedido
LEFT JOIN stg_capa_pedido_venda_motivo
    ON stg_capa_pedido_venda_motivo.codigo_pedido = stg_capa_pedido_venda.codigo_pedido