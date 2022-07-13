

  create or replace view `dw-adventureworks-354222`.`dbt_lynanderson`.`stg_produto_subcategoria`
  OPTIONS()
  as 

SELECT
         cast(productsubcategoryid AS int) AS codigo_subcategoria
       , cast(productcategoryid AS int) AS codigo_categoria
       , trim(name) AS descricao_subcategoria
       , cast(modifieddate AS date) AS data_modificacao  
FROM `dw-adventureworks-354222`.`raw_adventureworks`.`production_product_subcategory`;

