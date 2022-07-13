

  create or replace table `dw-adventureworks-354222`.`dbt_lynanderson`.`dim_cidade`
  
  
  OPTIONS()
  as (
    

WITH stg_cidade AS (
    SELECT
    *
    FROM `dw-adventureworks-354222`.`dbt_lynanderson`.`stg_cidade`
)

SELECT 
          codigo_cidade
        , endereco
        , endereco_complemento
        , nome_cidade
        , codigo_estado
        , cep
        , data_modificacao
FROM stg_cidade
  );
  