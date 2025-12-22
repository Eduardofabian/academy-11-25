with
    employees as (
        select *
        from {{ ref('int_employees_prep') }}
    )

    , renamed as (
        select
            employee_pk as employee_id
            , full_name as employee_name
            , job_title as job_position
            , city as employee_city
            , region as employee_region
            , country as employee_country
        from employees
    )

select * from renamed