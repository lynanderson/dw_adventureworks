{{ config(
       materialized='view',
       tags=["faturamento"]
) }}

SELECT
         cast(salesorderid AS int) AS codigo_pedido
       , cast(salesorderdetailid AS int) AS codigo_pedido_item
       , trim(carriertrackingnumber) AS numero_rastreamento
       , cast(orderqty AS int) AS qtde_pedida
       , cast(productid AS int) AS codigo_produto
       , cast(specialofferid AS int) AS codigo_oferta_especial
       , cast(unitprice AS numeric) AS preco_unitario
       , cast(unitpricediscount AS numeric) AS desconto_unitario
       , cast(modifieddate AS date) AS data_modificacao  
FROM {{ source('raw_adventureworks','sales_sales_order_detail')}}
