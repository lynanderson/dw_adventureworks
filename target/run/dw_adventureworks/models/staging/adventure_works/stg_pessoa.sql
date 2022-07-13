

  create or replace view `dw-adventureworks-354222`.`dbt_lynanderson`.`stg_pessoa`
  OPTIONS()
  as 

SELECT
         cast(businessentityid AS int) AS codigo_empresa
       , trim(persontype) AS tipo_pessoa
       , trim(title) AS titulo
       , trim(firstname) AS nome
       , trim(concat(middlename,'. ', lastname)) AS sobrenome
       , trim(suffix) AS sufixo
       , cast(emailpromotion AS int) AS email_promocional
       , cast(modifieddate AS date) AS data_modificacao      
FROM `dw-adventureworks-354222`.`raw_adventureworks`.`person_person`;

