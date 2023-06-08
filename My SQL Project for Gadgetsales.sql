select * from gadgetsales.product

---
Q1
---
select product.name as Device, sum(orderitem.quantity) as TQ
from product
join orderitem
on product.product_id = orderitem.product_id
group by product.name
order by TQ desc
Limit 1;
---
Q2
---
select product.name as Device, sum(orderitem.quantity) as TQ
from product
join orderitem
on product.product_id = orderitem.product_id
group by product.name
order by TQ asc
Limit 1;
---
Q3
---
select product.name, price
from product 
order by price desc
limit 3;
---
Q4
---
select customer.name as Buyer, sum(orderitem.quantity * product.price) as TSpent
from customer
join orders on customer.customer_id = orders.customer_id
join orderitem on orders.order_id = orderitem.order_id
join product on orderitem.product_id = product.product_id
group by customer.name
order by TSpent
limit 3;
---
Q5
---
select orders.order_date, sum(orderitem.quantity) as TQty
from gadgetsales.orders
join orderitem
on orders.order_id = orderitem.order_id
group by orders.order_date
order by TQty desc
limit 1;
---
Q6
---
select customer.name as Buyer, sum(orderitem.quantity) as SQty
from gadgetsales.customer
join orders on customer.customer_id = orders.customer_id
join orderitem on orderitem.order_id = orders.order_id
group by customer.name
order by SQty desc
limit 1;
---
Q7
---
select product.name, sum(orderitem.quantity) as SQty
from gadgetsales.product
join orderitem on product.product_id = orderitem.product_id
group by product.name
order by SQty asc
limit 3;
---
Q8
---
select product.name, orders.order_date, sum(orderitem.quantity) as TQty
from product
join orders on orders.order_id = order_id
join orderitem on orderitem.product_id = product.product_id
where product.name like 'iPad% Pro%'
group by product.name, orders.order_date
order by TQty desc
limit 1;
---
Q9
---
select product.name, customer.name, sum(orderitem.quantity) as TQty
from product
join customer on customer_id = customer.customer_id
join orderitem on orderitem.product_id = product.product_id
where product.name like 'iPhone% 13%'
group by product.name, Customer.name
order by TQty desc
limit 1;
---
Q10
---
select product.name, product.price, sum(orderitem.quantity)
from product 
join orderitem on orderitem.product_id = product.product_id
group by product.name, product.price
order by product.price asc, sum(orderitem.quantity) desc;

select product.name, product.price, sum(orderitem.quantity)
from product 
join orderitem on orderitem.product_id = product.product_id
group by product.name, product.price
order by product.price desc, sum(orderitem.quantity) desc;