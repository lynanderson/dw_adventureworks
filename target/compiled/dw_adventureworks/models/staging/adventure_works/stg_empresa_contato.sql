

SELECT
         cast(businessentityid AS int) AS codigo_empresa
       , cast(personid AS int) AS codigo_pessoa
       , cast(contacttypeid AS int) AS codigo_tipo_contato
       , cast(modifieddate AS date) AS data_modificacao      
FROM `dw-adventureworks-354222`.`raw_adventureworks`.`person_business_entity_contact`