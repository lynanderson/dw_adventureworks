

WITH stg_motivo_venda AS (
    SELECT
        * 
    FROM `dw-adventureworks-354222`.`dbt_lynanderson`.`stg_motivo_venda`
)

SELECT
         codigo_motivo
       , descricao_motivo
       , tipo_motivo
       , data_modificacao   
FROM stg_motivo_venda