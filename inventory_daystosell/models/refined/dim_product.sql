WITH staging_data AS(
    SELECT *
    FROM {{ ref('origin_item') }}
),

dim_product AS(
    SELECT
        product_id,
        product_sku,
        product_category,
        product_name,
        product_brand,
        product_department
    FROM
        staging_data
)

SELECT *
FROM
    dim_product
