{{ config(
       materialized='view',
       tags=["faturamento"]
) }}

SELECT
         cast(salesorderid AS int) AS codigo_pedido
       , cast(revisionnumber AS int) AS numero_revisao
       , cast(orderdate AS date) AS data_emissao
       , cast(duedate AS date) AS data_vencimento
       , cast(shipdate AS date) AS data_entrega
       --, cast(status AS int) AS status_pedido
       , CASE WHEN cast(status AS int) = 1 THEN 'Em Processo'
              WHEN cast(status AS int) = 2 THEN 'Aprovado'
              WHEN cast(status AS int) = 3 THEN 'Aguardando'
              WHEN cast(status AS int) = 4 THEN 'Rejeitado'
              WHEN cast(status AS int) = 5 THEN 'Entregue'
              WHEN cast(status AS int) = 6 THEN 'Cancelado'
              ELSE 'Indefinido'
         END AS status_pedido
       , trim(purchaseordernumber) AS numero_pedido_compra
       , trim(accountnumber) AS numero_conta
       , cast(customerid AS int) AS codigo_cliente
       , cast(salespersonid AS int) AS codigo_vendedor
       , cast(territoryid AS int) AS codigo_territorio
       , cast(billtoaddressid AS int) AS codigo_cidade
       , cast(shiptoaddressid AS int) AS codigo_endereco_entrega
       , cast(shipmethodid AS int) AS codigo_modo_entrega
       , cast(creditcardid AS int) AS codigo_cartao_credito
       , trim(creditcardapprovalcode) AS codigo_aprovacao_cartao
       , cast(currencyrateid AS numeric) AS taxa_cambio
       , cast(subtotal AS numeric) AS valor_total_liquido
       , cast(taxamt AS numeric) AS total_taxa
       , cast(freight AS numeric) AS carga
       , cast(totaldue AS numeric) AS valor_total_bruto
       , cast(modifieddate AS date) AS data_modificacao  
FROM {{ source('raw_adventureworks','sales_sales_order_header')}}
