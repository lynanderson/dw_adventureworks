{{ config(
       materialized='view',
       tags=["endereco","pessoa"]
) }}

SELECT
         trim(countryregioncode) AS sigla_pais
       , trim(name) AS nome_pais
       , cast(modifieddate AS date) AS data_modificacao      
FROM {{ source('raw_adventureworks','person_country_region')}}
