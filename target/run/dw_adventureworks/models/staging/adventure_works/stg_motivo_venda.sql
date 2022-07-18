

  create or replace view `dw-adventureworks-354222`.`dbt_lynanderson`.`stg_motivo_venda`
  OPTIONS()
  as 

SELECT
         cast(salesreasonid AS int) AS codigo_motivo
       , CASE WHEN trim(name) IS NULL THEN 'Indefinido'
              ELSE trim(name)
         END AS descricao_motivo
       --, trim(name) AS descricao_motivo
       , CASE WHEN trim(reasontype) IS NULL THEN 'Indefinido'
              ELSE trim(reasontype)
         END AS tipo_motivo
       --, trim(reasontype) AS tipo_motivo
       , cast(modifieddate AS date) AS data_modificacao       
FROM `dw-adventureworks-354222`.`raw_adventureworks`.`sales_sales_reason`;

