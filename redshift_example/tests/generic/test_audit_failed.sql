{% test audit_failed(model) %}

with validation as (

    select
       *

    from {{ model }}

),

validation_errors as (

    select
        count(*) as n

    from validation
    -- if this is true, then data is present in the audit table
    having count(*) > 0

)

select *
from validation_errors

{% endtest %}