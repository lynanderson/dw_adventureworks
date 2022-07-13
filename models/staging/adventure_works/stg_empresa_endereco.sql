{{ config(
       materialized='view',
       tags=["endereco","pessoa"]
) }}

SELECT
         cast(businessentityid AS int) AS codigo_empresa
       , cast(addressid AS int) AS codigo_cidade
       , cast(addresstypeid AS int) AS codigo_tipo_endereco 
       , cast(modifieddate AS date) AS data_modificacao      
FROM {{ source('raw_adventureworks','person_business_entity_address')}}
