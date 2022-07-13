{{ config(
       materialized='view',
       tags=["produto"]
) }}

SELECT
         cast(productcategoryid AS int) AS codigo_categoria
       , trim(name) AS descricao_categoria
       , cast(modifieddate AS date) AS data_modificacao  
FROM {{ source('raw_adventureworks','production_product_category')}}
