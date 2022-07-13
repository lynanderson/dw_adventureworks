select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
    

select *
from `dw-adventureworks-354222`.`dbt_lynanderson`.`fct_pedido_venda`
where codigo_pedido is null



      
    ) dbt_internal_test