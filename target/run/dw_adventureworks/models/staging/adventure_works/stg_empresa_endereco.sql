

  create or replace view `dw-adventureworks-354222`.`dbt_lynanderson`.`stg_empresa_endereco`
  OPTIONS()
  as 

SELECT
         cast(businessentityid AS int) AS codigo_empresa
       , cast(addressid AS int) AS codigo_cidade
       , cast(addresstypeid AS int) AS codigo_tipo_endereco 
       , cast(modifieddate AS date) AS data_modificacao      
FROM `dw-adventureworks-354222`.`raw_adventureworks`.`person_business_entity_address`;

