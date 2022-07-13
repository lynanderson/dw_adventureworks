
    
    

with dbt_test__target as (
  
  select nome_pais as unique_field
  from `dw-adventureworks-354222`.`dbt_lynanderson`.`dim_pais`
  where nome_pais is not null
  
)

select
    unique_field,
    count(*) as n_records

from dbt_test__target
group by unique_field
having count(*) > 1


