with
    source_suppliers as (
        select *
        from {{ source('nwind', 'suppliers') }}
    )

    , renamed as (
        select
            -- 1. Identificadores
            cast(supplier_id as int) as supplier_pk

            -- 2. Informações Principais
            , cast(company_name as string) as supplier_name

            -- 3. Bloco de Contato (Pessoa e Telefone juntos)
            , cast(contact_name as string) as supplier_contact_name
            , cast(contact_title as string) as supplier_contact_title
            , cast(phone as string) as supplier_phone

            -- 4. Bloco de Localização (Do específico pro geral)
            , cast(address as string) as supplier_address
            , cast(city as string) as supplier_city
            , cast(region as string) as supplier_region
            , cast(postal_code as string) as supplier_postal_code
            , cast(country as string) as supplier_country
            
        from source_suppliers
    )

select * from renamed