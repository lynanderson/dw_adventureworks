

WITH stg_venda_motivo AS (
    SELECT
        * 
    FROM `dw-adventureworks-354222`.`dbt_lynanderson`.`stg_venda_motivo`
)

SELECT
         codigo_motivo
       , descricao
       , tipo_motivo
       , data_modificacao   
FROM stg_venda_motivo