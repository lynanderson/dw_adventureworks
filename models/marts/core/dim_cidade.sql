{{ config(
       materialized='table',
       tags=["endereco"]
) }}

WITH stg_cidade AS (
    SELECT
    *
    FROM {{ ref('stg_cidade') }}
)

SELECT 
          codigo_cidade
        , endereco
        , endereco_complemento
        , nome_cidade
        , codigo_estado
        , cep
        , data_modificacao
FROM stg_cidade