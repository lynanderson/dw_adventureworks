{{ config(
       materialized='view',
       tags=["produto"]
) }}

SELECT
         cast(productid AS int) AS codigo_produto
       , trim(name) AS descricao_produto
       , trim(productnumber) AS codigo_barra
       , CASE WHEN trim(color) IS NULL THEN 'Incolor'
              ELSE trim(color)
         END AS cor
       , cast(safetystocklevel AS int) AS estoque_seguranca
       , cast(reorderpoint AS int) AS ponto_pedido
       , cast(standardcost AS numeric) AS custo_padrao
       , cast(listprice AS numeric) AS preco_tabela
       , trim(size) AS dimensao_produto
       , trim(sizeunitmeasurecode) AS dimensao_unidade_medida
       , cast(weight AS numeric) AS peso_produto
       , trim(weightunitmeasurecode) AS peso_unidade_medida
       , cast(daystomanufacture AS int) AS dias_para_fabricar
       , trim(productline) AS linha_produto
       , trim(class) AS classe_produto
       , trim(style) AS estilo_produto
       , cast(productsubcategoryid AS int) AS codigo_subcategoria
       , cast(sellstartdate AS date) AS inicio_venda
       , cast(sellenddate AS date) AS fim_venda
       , cast(discontinueddate AS date) AS data_descontinuacao
       , cast(modifieddate AS date) AS data_modificacao  
FROM {{ source('raw_adventureworks','production_product')}}
