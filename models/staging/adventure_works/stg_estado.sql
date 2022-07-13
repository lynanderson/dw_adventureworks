{{ config(
       materialized='view',
       tags=["endereco","pessoa"]
) }}

SELECT
         cast(stateprovinceid AS int) AS codigo_estado
       , trim(stateprovincecode) AS sigla_estado
       , trim(countryregioncode) AS sigla_pais
       , trim(name) AS nome_estado
       , cast(territoryid AS int) AS codigo_territorio
       , cast(modifieddate AS date) AS data_modificacao      
FROM {{ source('raw_adventureworks','person_state_province')}}
