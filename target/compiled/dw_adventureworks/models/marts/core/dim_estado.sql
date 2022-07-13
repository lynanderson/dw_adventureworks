

WITH stg_estado AS (
    SELECT
    *
    FROM `dw-adventureworks-354222`.`dbt_lynanderson`.`stg_estado`
)

SELECT 
         codigo_estado
       , sigla_estado
       , sigla_pais
       , nome_estado
       , codigo_territorio
       , data_modificacao  
FROM stg_estado