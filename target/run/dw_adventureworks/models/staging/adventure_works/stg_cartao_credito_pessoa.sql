

  create or replace view `dw-adventureworks-354222`.`dbt_lynanderson`.`stg_cartao_credito_pessoa`
  OPTIONS()
  as 

SELECT
         cast(businessentityid AS int) AS codigo_empresa
       , cast(creditcardid AS int) AS codigo_cartao_credito
       , cast(modifieddate AS date) AS data_modificacao  
FROM `dw-adventureworks-354222`.`raw_adventureworks`.`sales_person_credit_card`;

