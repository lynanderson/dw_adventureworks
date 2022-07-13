select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
    

with all_values as (

    select
        tipo_motivo as value_field,
        count(*) as n_records

    from `dw-adventureworks-354222`.`dbt_lynanderson`.`dim_motivo_venda`
    group by tipo_motivo

)

select *
from all_values
where value_field not in (
    'Other','Marketing','Promotion'
)



      
    ) dbt_internal_test