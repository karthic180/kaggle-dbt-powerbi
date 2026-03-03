select
    o.order_id,
    o.customer_id,
    o.order_date,
    sum(oi.price) as total_revenue,
    count(*) as total_items
from {{ ref('stg_orders') }} o
join {{ ref('stg_order_items') }} oi
    on o.order_id = oi.order_id
group by 1,2,3