WITH 

staging_inventory_with_product_detail AS(
    SELECT 
    *,
    -- DW values
    null as dw_created_at,
    null as dw_updated_at,
    null as dw_is_deleted,
    null as dw_deleted_at
    FROM 
    thelook_inventory.raw.inventory_items ITEM

    LEFT JOIN
    thelook_inventory.raw.distribution_center DC
    ON ITEM.product_distribution_center_id  = DC.id
)

    SELECT * FROM staging_inventory_with_product_detail
/*
WITH staging_centers AS(
    SELECT * FROM thelook_inventory.raw.distribution_center;
)
    SELECT * FROM staging_centers;
*/