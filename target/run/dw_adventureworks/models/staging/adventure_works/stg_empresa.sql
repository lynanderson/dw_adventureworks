

  create or replace view `dw-adventureworks-354222`.`dbt_lynanderson`.`stg_empresa`
  OPTIONS()
  as 

SELECT
         cast(businessentityid AS int) AS codigo_empresa
       , cast(modifieddate AS date) AS data_modificacao      
FROM `dw-adventureworks-354222`.`raw_adventureworks`.`person_business_entity`;

