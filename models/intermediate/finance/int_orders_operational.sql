select *, round(margin + shipping_fee - ship_cost - logcost, 2) as operational_margin
from {{ ref("int_sales_margin") }}
join {{ ref("stg_raw__ship") }} using (orders_id)
