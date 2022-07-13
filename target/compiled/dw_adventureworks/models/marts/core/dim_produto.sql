

WITH stg_produto AS (
    SELECT
    *
    FROM `dw-adventureworks-354222`.`dbt_lynanderson`.`stg_produto`
),

stg_produto_subcategoria AS (
    SELECT
    *
    FROM `dw-adventureworks-354222`.`dbt_lynanderson`.`stg_produto_subcategoria`
),

stg_produto_categoria AS (
    SELECT
    *
    FROM `dw-adventureworks-354222`.`dbt_lynanderson`.`stg_produto_categoria`
)

SELECT 
         stg_produto.codigo_produto
       , stg_produto.descricao_produto
       , stg_produto.codigo_barra
       , stg_produto.cor
       , stg_produto.estoque_seguranca
       , stg_produto.ponto_pedido
       , stg_produto.custo_padrao
       , stg_produto.preco_tabela
       , stg_produto.dimensao_produto
       , stg_produto.dimensao_unidade_medida
       , stg_produto.peso_produto
       , stg_produto.peso_unidade_medida
       , stg_produto.dias_para_fabricar
       , stg_produto.linha_produto
       , stg_produto.classe_produto
       , stg_produto.estilo_produto
       , stg_produto_subcategoria.codigo_categoria
       , stg_produto_categoria.descricao_categoria
       , stg_produto.codigo_subcategoria
       , stg_produto_subcategoria.descricao_subcategoria
       , stg_produto.inicio_venda
       , stg_produto.fim_venda
       , stg_produto.data_descontinuacao
       , stg_produto.data_modificacao  
FROM stg_produto
LEFT JOIN stg_produto_subcategoria
    ON stg_produto_subcategoria.codigo_subcategoria = stg_produto.codigo_subcategoria
LEFT JOIN stg_produto_categoria
    ON stg_produto_categoria.codigo_categoria = stg_produto_subcategoria.codigo_categoria