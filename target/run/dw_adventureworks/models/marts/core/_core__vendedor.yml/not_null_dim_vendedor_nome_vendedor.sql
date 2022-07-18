select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
    

select *
from `dw-adventureworks-354222`.`dbt_lynanderson`.`dim_vendedor`
where nome_vendedor is null



      
    ) dbt_internal_test