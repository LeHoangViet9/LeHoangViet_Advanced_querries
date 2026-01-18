--Tìm khách hàng có tổng giá trị đơn hàng cao nhất
select c.customer_name, sum(o.total_amount) as "Total" from customers c join orders o on c.customer_id = o.customer_id
group by c.customer_name
having sum(o.total_amount)>
( select max(total) from
(select sum(total_amount) as total from orders
group by customer_id) t );

-- Liệt kê sản phẩm chưa từng được bán
select p.product_id,p.product_name from products p
where not EXISTS(
select 1
from order_items oi 
where oi.product_id=p.product_id
)

--Tìm khách hàng có đơn hàng đầu tiên trong tháng hiện tại
select c.customer_name
from customers c join orders o on c.customer_id=o.customer_id
where o.order_date =
(select min(o.order_date) from orders o where c.customer_id=o.customer_id )
AND DATE_TRUNC('month', o.order_date) = DATE_TRUNC('month', CURRENT_DATE)

-- Liệt kê sản phẩm có giá cao hơn giá trung bình của danh mục đó
select product_name from products p1 where price >
(select avg(p.price) from products p where p1.category_id=p.category_id)

