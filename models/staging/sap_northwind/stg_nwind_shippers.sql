with
    source_shippers as (
        select *
        from {{ source('nwind', 'shippers') }}
    )

    , renamed as (
        select
            cast(shipper_id as int) as shipper_pk
            , cast(company_name as string) as shipper_name
            , cast(phone as string) as shippers_phone
        from source_shippers
    )

select * from renamed