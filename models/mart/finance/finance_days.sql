select 
  date_date, 
  count(*) as nb_transactions,
  round(sum(revenue),2) as revenue,
  round(avg(revenue),2) as avg_basket,
  round(sum(margin),2) as margin,
  round(sum(operational_margin),2) as operational_margin

from {{ ref("int_orders_operational") }}
group by date_date
order by date_date desc

