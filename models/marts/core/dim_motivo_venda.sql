{{ config(
       materialized='table',
       tags=["faturamento"]
) }}

WITH stg_motivo_venda AS (
    SELECT
        * 
    FROM {{ ref('stg_motivo_venda')}}
)

SELECT
         codigo_motivo
       , descricao_motivo
       , tipo_motivo
       , data_modificacao   
FROM stg_motivo_venda

