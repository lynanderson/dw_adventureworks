

WITH stg_pais AS (
    SELECT
    *
    FROM `dw-adventureworks-354222`.`dbt_lynanderson`.`stg_pais`
)

SELECT 
         sigla_pais
       , nome_pais
       , data_modificacao    
FROM stg_pais