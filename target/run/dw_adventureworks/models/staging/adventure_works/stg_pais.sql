

  create or replace view `dw-adventureworks-354222`.`dbt_lynanderson`.`stg_pais`
  OPTIONS()
  as 

SELECT
         trim(countryregioncode) AS sigla_pais
       , trim(name) AS nome_pais
       , cast(modifieddate AS date) AS data_modificacao      
FROM `dw-adventureworks-354222`.`raw_adventureworks`.`person_country_region`;

