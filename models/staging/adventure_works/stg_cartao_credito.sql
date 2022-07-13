{{ config(
       materialized='view',
       tags=["pessoa"]
) }}

SELECT
         cast(creditcardid AS int) AS codigo_cartao_credito
       , trim(cardtype) AS tipo_cartao
       , cast(cardnumber AS int) AS numero_cartao
       , cast(expmonth AS int) AS mes_de_validade
       , cast(expyear AS int) AS ano_de_validade
       , cast(modifieddate AS date) AS data_modificacao
FROM {{ source('raw_adventureworks','sales_credit_card')}}