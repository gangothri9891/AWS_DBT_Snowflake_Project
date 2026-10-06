{{ config(materialized='table',unique_key='HOST_ID') }}
select 
    HOST_ID,
    replace(host_name, ' ', '') as HOST_NAME,
    HOST_SINCE as HOST_SINCE,
    IS_SUPERHOST as IS_SUPERHOST,
    RESPONSE_RATE as RESPONSE_RATE,
    case
    when response_rate >95 then 'Very Good'
    when response_rate >80 then 'Good'
    when response_rate >60 then 'Fair'
    
    else 'Poor'
    end as RESPONSE_RATE_QULAITY,
    CREATED_AT AS CREATED_AT

FROM 
     {{ ref('bronze_hosts') }}