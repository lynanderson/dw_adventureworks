{{ config(
       materialized='view',
       tags=["pessoa"]
) }}

SELECT
         cast(businessentityid AS int) AS codigo_empresa
       , trim(persontype) AS tipo_pessoa
       , trim(title) AS titulo
       , trim(firstname) AS nome
       , trim(concat(middlename,'. ', lastname)) AS sobrenome
       , trim(suffix) AS sufixo
       , cast(emailpromotion AS int) AS email_promocional
       , cast(modifieddate AS date) AS data_modificacao      
FROM {{ source('raw_adventureworks','person_person')}}
