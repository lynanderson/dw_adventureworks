

SELECT
         cast(productcategoryid AS int) AS codigo_categoria
       , trim(name) AS descricao_categoria
       , cast(modifieddate AS date) AS data_modificacao  
FROM `dw-adventureworks-354222`.`raw_adventureworks`.`production_product_category`