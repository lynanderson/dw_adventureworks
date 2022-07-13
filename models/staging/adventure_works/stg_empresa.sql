{{ config(
       materialized='view',
       tags=["pessoa"]
) }}

SELECT
         cast(businessentityid AS int) AS codigo_empresa
       , cast(modifieddate AS date) AS data_modificacao      
FROM {{ source('raw_adventureworks','person_business_entity')}}
