

  create or replace view `dw-adventureworks-354222`.`dbt_lynanderson`.`stg_motivo_venda`
  OPTIONS()
  as 

SELECT
         cast(salesreasonid AS int) AS codigo_motivo
       , trim(name) AS descricao_motivo
       , trim(reasontype) AS tipo_motivo
       , cast(modifieddate AS date) AS data_modificacao       
FROM `dw-adventureworks-354222`.`raw_adventureworks`.`sales_sales_reason`;

