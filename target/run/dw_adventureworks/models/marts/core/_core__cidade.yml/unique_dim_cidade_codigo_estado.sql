select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
    

with dbt_test__target as (
  
  select codigo_estado as unique_field
  from `dw-adventureworks-354222`.`dbt_lynanderson`.`dim_cidade`
  where codigo_estado is not null
  
)

select
    unique_field,
    count(*) as n_records

from dbt_test__target
group by unique_field
having count(*) > 1



      
    ) dbt_internal_test