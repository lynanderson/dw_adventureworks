{{ config(
       materialized='view',
       tags=["endereco"]
) }}

SELECT
         cast(addressid AS int) AS codigo_cidade
       , trim(addressline1) AS endereco
       , trim(addressline2) AS endereco_complemento
       , trim(city) AS nome_cidade
       , cast(stateprovinceid AS int) AS codigo_estado
       , trim(postalcode) AS cep
       , cast(modifieddate AS date) AS data_modificacao      
FROM {{ source('raw_adventureworks','person_address')}}
