with
    source_customers as (
        select *
        from {{source('nwind', 'customers')}}
    )
    , renamed as (
        select
            {{ dbt_utils.generate_surrogate_key(['customer_id']) }} as customer_sk
            , cast (customer_id as string) as customer_id
            , cast(company_name as string) as company_name
            , cast(contact_name as string) as contact_name
            , cast(contact_title as string) as contact_title
            , cast(address as string) as customer_address
            , cast(city as string) as customer_city
            , cast(region as string) as customer_region
            , cast(country as string) as customer_country
            , cast(phone as string) as customer_phone
        from source_customers
    )

select * from renamed