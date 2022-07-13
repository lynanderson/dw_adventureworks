

SELECT
         cast(businessentityid AS int) AS codigo_empresa
       , cast(modifieddate AS date) AS data_modificacao      
FROM `dw-adventureworks-354222`.`raw_adventureworks`.`person_business_entity`