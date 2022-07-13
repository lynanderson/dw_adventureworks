

  create or replace view `dw-adventureworks-354222`.`dbt_lynanderson`.`stg_vendedor`
  OPTIONS()
  as 

SELECT
         cast(businessentityid AS int) AS codigo_empresa
       , cast(territoryid AS int) AS codigo_territorio
       , cast(salesquota AS numeric) AS meta
       , cast(bonus AS numeric) AS bonificacao
       , cast(commissionpct AS numeric) AS comissao
       , cast(salesytd AS numeric) AS venda_total
       , cast(saleslastyear AS numeric) AS venda_total_ano_passado
       , cast(modifieddate AS date) AS data_modificacao       
FROM `dw-adventureworks-354222`.`raw_adventureworks`.`sales_sales_person`;

