
    
    

with child as (
    select codigo_empresa as from_field
    from `dw-adventureworks-354222`.`dbt_lynanderson`.`dim_cliente`
    where codigo_empresa is not null
),

parent as (
    select codigo_empresa as to_field
    from `dw-adventureworks-354222`.`dbt_lynanderson`.`stg_empresa`
)

select
    from_field

from child
left join parent
    on child.from_field = parent.to_field

where parent.to_field is null


