WITH staging_data AS(
    SELECT *
    FROM
        {{ ref('origin_item')}}
),

cte_daily_agg AS (
  SELECT
    product_id,
    {# product_sku,
    product_category,
    product_name,
    product_brand,
    product_department, #}
    product_distribution_center_id,
    date_trunc('day', sold_at) as record_date,
    COUNT(id) AS sales_qty,
    SUM(cost) AS total_cost,
    SUM(product_retail_price) AS total_revenue
  FROM
    staging_data {# thelook_inventory.staging.origin_item #}
  WHERE
    sold_at IS NOT NULL
  GROUP BY
        product_id,
    product_sku,
    product_category,
    product_name,
    product_brand,
    product_department,
    product_distribution_center_id,
    date_trunc('day', sold_at)
),

cte_daily_sales_metrics AS(
    SELECT
    cte_daily_agg.*,
    ROUND(total_revenue - total_cost,2) as profit_2dp_daily
    FROM 
    cte_daily_agg
    ORDER BY 
    record_date DESC,
    sales_qty DESC
    {# LIMIT 10; #}

)

SELECT
    *
FROM
    cte_daily_sales_metrics
    

  
