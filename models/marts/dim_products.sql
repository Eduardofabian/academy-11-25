select
    product_sk as sk_product      -- Chave primária (Hash)
    , product_id as id_product    -- Chave de negócio (Visual)
    , product_name
    , category_name
    , supplier_name
    , supplier_city
    , supplier_region
    , supplier_country
    , unit_price
    , quantity_per_unit
    , units_in_stock
    , units_on_order
    , reorder_level
    , is_discontinued
from {{ ref('int_products_enriched') }}