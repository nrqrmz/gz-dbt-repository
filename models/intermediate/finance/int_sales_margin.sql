with
    joined as (
        select *
        from {{ ref("stg_raw__sales") }}
        left join {{ ref("stg_raw__product") }} using (products_id)
    ),
    renamed as (select *, round(quantity * cast(purchase_price as float64), 2) as purchase_cost from joined)

select *, 
--   round(revenue - purchase_cost,2) as margin
    {{ margin('revenue', 'purchase_cost', 1)}} AS margin
from renamed
