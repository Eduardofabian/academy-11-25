with
    source_products as (
        select *
        from {{ source('nwind', 'products') }}
    )

    , renamed as (
        select
            -- (Hash)
            {{ dbt_utils.generate_surrogate_key(['product_id']) }} as product_sk
            -- O ID Original
            , cast(product_id as int) as product_id
            -- restante
            , cast(product_name as string) as product_name
            , cast(supplier_id as int) as supplier_fk
            , cast(category_id as int) as category_fk
            , cast(quantity_per_unit as string) as quantity_per_unit
            , cast(unit_price as numeric) as unit_price
            , cast(units_in_stock as int) as units_in_stock
            , cast(units_on_order as int) as units_on_order
            , cast(reorder_level as int) as reorder_level
            , case
                when discontinued = 1 then true
                else false
            end as is_discontinued
        from source_products
    )

select * from renamed