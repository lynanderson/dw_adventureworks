
    
    

with dbt_test__target as (
  
  select codigo_pedido_item as unique_field
  from `dw-adventureworks-354222`.`dbt_lynanderson`.`fct_pedido_venda`
  where codigo_pedido_item is not null
  
)

select
    unique_field,
    count(*) as n_records

from dbt_test__target
group by unique_field
having count(*) > 1


