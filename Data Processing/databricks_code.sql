select transaction_id, transaction_date, transaction_time, transaction_qty, store_id, store_location, product_id, unit_price, product_category, product_type, product_detail,
dayname(transaction_date) as day_name,
monthname(transaction_date) as month_name,
dayofmonth(transaction_date) as day,
unit_price*transaction_qty as revenue,
Case
when dayname(transaction_date) in ('Saturday', 'Sunday') then 'Weekend'
else 'Weekday'
end as day_classification,
Case
when date_format(transaction_time, 'HH:mm:ss') between '05:00:00' and '08:59:59' then '01.rush hour'
when date_format(transaction_time, 'HH:mm:ss') between '09:00:00' and '11:59:59' then '02.mid morning'
when date_format(transaction_time, 'HH:mm:ss') between '12:00:00' and '15:59:59' then '03.afternoon'
when date_format(transaction_time, 'HH:mm:ss') between '16:00:00' and '18:59:59' then '04.rush hour'
else '05.night'
end as time_classification,
Case
when (transaction_qty*unit_price) <=50 then 'low'
when (transaction_qty*unit_price)  between 51 and 200 then '02.Medium spender'
when (transaction_qty*unit_price)  between 201 and 300 then '03.moreki'
when (transaction_qty*unit_price)  between 501 and 1000 then '04.high spender'
else '05.moreki'
end as revenue_classification
from `workspace`.`default`.`1771947879858_bright_coffee_shop_sales`;
