WITH staging_data AS(
    SELECT *
    FROM
        {{ref('origin_dc')}}
)

SELECT
    dc_id,
    dc_name,
    dc_lat,
    dc_lon,
    dc_geom
FROM
    staging_data
WHERE
    dw_deleted_at IS NULL