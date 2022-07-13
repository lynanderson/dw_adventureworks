

SELECT
         cast(stateprovinceid AS int) AS codigo_provincia
       , trim(stateprovincecode) AS sigla_provincia
       , trim(countryregioncode) AS sigla_estado
       , trim(name) AS nome_pais
       , cast(territoryid AS int) AS codigo_territorio
       , cast(modifieddate AS date) AS data_modificacao      
FROM `dw-adventureworks-354222`.`raw_adventureworks`.`person_state_province`