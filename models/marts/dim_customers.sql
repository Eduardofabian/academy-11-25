select
    customer_sk as sk_customer
    , customer_id as id_customer
    , customer_contact_name as customer_contact
    , customer_name
    , customer_city
    , customer_region
    , customer_country
from {{ ref('int_customers_prep') }}