{{ config(
       materialized='view',
       tags=["produto"]
) }}

SELECT
         cast(productsubcategoryid AS int) AS codigo_subcategoria
       , cast(productcategoryid AS int) AS codigo_categoria
       , trim(name) AS descricao_subcategoria
       , cast(modifieddate AS date) AS data_modificacao  
FROM {{ source('raw_adventureworks','production_product_subcategory')}}
