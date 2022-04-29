{% macro get_stats_crashes_os_version_columns() %}

{% set columns = [
    {"name": "_file", "datatype": dbt_utils.type_string()},
    {"name": "_fivetran_synced", "datatype": dbt_utils.type_timestamp()},
    {"name": "_line", "datatype": dbt_utils.type_int()},
    {"name": "_modified", "datatype": dbt_utils.type_timestamp()},
    {"name": "android_os_version", "datatype": dbt_utils.type_string()},
    {"name": "daily_anrs", "datatype": dbt_utils.type_int()},
    {"name": "daily_crashes", "datatype": dbt_utils.type_int()},
    {"name": "date", "datatype": "date"},
    {"name": "package_name", "datatype": dbt_utils.type_string()}
] %}

{{ return(columns) }}

{% endmacro %}
