with
    shippers as (
        select *
        from {{ ref('stg_nwind_shippers') }}
    )

select * from shippers