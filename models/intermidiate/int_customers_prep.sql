with
    -- import ctes

    customers as (
        select *
        from {{ ref('stg_nwind_customers') }}
    )
select * from customers