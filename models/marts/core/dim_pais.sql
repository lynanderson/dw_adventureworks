{{ config(
       materialized='table',
       tags=["endereco"]
) }}

WITH stg_pais AS (
    SELECT
    *
    FROM {{ ref('stg_pais') }}
)

SELECT 
         sigla_pais
       , nome_pais
       , data_modificacao    
FROM stg_pais