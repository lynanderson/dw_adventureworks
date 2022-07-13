{{ config(
       materialized='view',
       tags=["faturamento"]
) }}

SELECT
         cast(salesorderid AS int) AS codigo_pedido
       , cast(salesreasonid AS int) AS codigo_motivo
       , cast(modifieddate AS date) AS data_modificacao  
FROM {{ source('raw_adventureworks','sales_sales_order_header_sales_reason')}}
