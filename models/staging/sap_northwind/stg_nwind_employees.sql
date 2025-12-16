with
    source_employees as (
        select *
        -- Corrigido: nome da tabela sem erros e sem espaços extras
        from {{ source('nwind', 'employees') }}
    )

    , renamed as (
        select
            cast(employee_id as int) as employee_pk
            , cast(concat(first_name, ' ', last_name) as string) as full_name
            , cast(title as string) as job_title
            -- Transformando em DATA para permitir cálculos
            , cast(birth_date as date) as birth_date
            , cast(hire_date as date) as hire_date
            , cast(address as string) as address
            , cast(city as string) as city
            , cast(region as string) as region
            , cast(country as string) as country
            , cast(home_phone as string) as phone
        -- Corrigido: nome da CTE idêntico ao definido lá em cima
        from source_employees
    )

select * from renamed