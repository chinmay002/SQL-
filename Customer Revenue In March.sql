select cust_id, sum(total_order_cost)
from orders
where DATE_PART('year',order_date)='2019'
and  DATE_PART('month',order_date)='03' 
group by cust_id;
