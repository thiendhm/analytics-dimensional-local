WITH staging_centers AS(
    SELECT 
        id as dc_id,
        name as dc_name,
        latitude as dc_lat,
        longitude as dc_lon,
        distribution_center_geom as dc_geom,
        
        -- DW values
        null as dw_created_at,
        null as dw_updated_at,
        null as dw_is_deleted,
        null as dw_deleted_at
        
    FROM thelook_inventory.raw.distribution_center
)
    SELECT * 
    FROM 
        staging_centers