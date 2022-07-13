
    
    

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
    'Other','Marketing'
)


