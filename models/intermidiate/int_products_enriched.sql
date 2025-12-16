with
    -- import ctes

    products as (
        select *
        from {{ ref('stg_nwind_products') }}
    )
    , categories as (
        select *
        from {{ ref('stg_nwind_categories') }}
    )
    , suppliers as(
        select *
        from{{ref('stg_nwind_suppliers')}}
    )
    -- transformation

    , joined as (
        select
            products.product_pk
            , products.product_name
            , categories.category_name
            , suppliers.supplier_name
            , suppliers.supplier_phone
            , suppliers.supplier_city
            , suppliers.supplier_region
            , suppliers.supplier_country
            , products.quantity_per_unit
            , products.unit_price
            , products.units_in_stock
            , products.units_on_order
            , products.reorder_level
            , products.is_discontinued
        from products
        left join categories on products.category_fk = categories.category_pk
        left join suppliers on products.supplier_fk = suppliers.supplier_pk
    )
select * from joined