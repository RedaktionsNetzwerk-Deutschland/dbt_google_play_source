
with base as (

    select * 
    from {{ ref('stg_google_play__stats_ratings_os_version_tmp') }}

),

fields as (

    select
        {{
            fivetran_utils.fill_staging_columns(
                source_columns=adapter.get_columns_in_relation(ref('stg_google_play__stats_ratings_os_version_tmp')),
                staging_columns=get_stats_ratings_os_version_columns()
            )
        }}
        
    from base
),

final as (
    
    select 
        date as date_day,
        android_os_version,
        package_name,
        -- an average of an average will only be taken for NULL os_versions :-) as they are being grouped together
        avg( cast( nullif(daily_average_rating, 'NA') as {{ dbt_utils.type_float() }} )) as average_rating,
        avg(total_average_rating) as rolling_total_average_rating
    from fields
    group by 1,2,3 -- group null os versions together 
)

select * from final
