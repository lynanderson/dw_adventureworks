{{ config(
       materialized='view',
       tags=["faturamento"]
) }}

SELECT
         cast(salesreasonid AS int) AS codigo_motivo
       , trim(name) AS descricao_motivo
       , trim(reasontype) AS tipo_motivo
       , cast(modifieddate AS date) AS data_modificacao       
FROM {{ source('raw_adventureworks','sales_sales_reason')}}