{{
    config(
        materialized='ephemeral'
    )
}}
With hosts AS
(
    select 
        HOST_ID,
        HOST_NAME,
        HOST_SINCE,
        IS_SUPERHOST,
        RESPONSE_RATE_QULAITY,
        HOST_CREATED_AT
    from
        {{ ref('obt') }}
)
select * from hosts