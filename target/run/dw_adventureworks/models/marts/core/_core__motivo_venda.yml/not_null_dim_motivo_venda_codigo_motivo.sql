select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
    

select *
from `dw-adventureworks-354222`.`dbt_lynanderson`.`dim_motivo_venda`
where codigo_motivo is null



      
    ) dbt_internal_test