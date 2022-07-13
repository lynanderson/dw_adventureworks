
    
    

with dbt_test__target as (
  
  select codigo_motivo as unique_field
  from `dw-adventureworks-354222`.`dbt_lynanderson`.`dim_motivo_venda`
  where codigo_motivo is not null
  
)

select
    unique_field,
    count(*) as n_records

from dbt_test__target
group by unique_field
having count(*) > 1


