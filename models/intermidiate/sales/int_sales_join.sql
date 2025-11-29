with
    -- import ctes
    order_items as (
        select *
        from {{ ref('stg_nwind_order_items') }}
    )
    , orders as (
        select *
        from {{ ref('stg_nwind_orders') }}
    )
    -- transformation
    , joined as (
        select
            order_items.order_item_sk
            , order_items.product_fk
            , orders.employee_fk
            , orders.customer_fk
            , orders.shipper_fk
            , orders.order_date
            , orders.ship_date
            , orders.required_delivery_date
            , order_items.discount_pct
            , order_items.unit_price
            , order_items.quantity
            , orders.freight
            , orders.order_number
            , orders.recipient_name
            , orders.recipient_city
            , orders.recipient_region
            , orders.recipient_country
        from order_items
        inner join orders on order_items.order_fk = orders.order_pk
    )
select * from joined