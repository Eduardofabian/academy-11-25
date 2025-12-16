with
    employees as (
        select *
        from {{ ref('stg_nwind_employees') }}
    )

select * from employees