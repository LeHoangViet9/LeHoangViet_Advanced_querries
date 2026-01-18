--Hiển thị thông tin đơn hàng kèm tên khách hàng và email (INNER JOIN)
select c.customer_name, c.email, o.order_id, o.order_date,o.status
from orders o join customers c on  c.customer_id = o.customer_id

--Tìm khách hàng vừa mua sản phẩm category 'Electronics' vừa mua 'Books'
Select c.customer_id, c.customer_name,
    count(o.order_id) as total_orders
From customers c
left join orders o ON c.customer_id = o.customer_id
GROUP BY c.customer_id, c.customer_name

--Hiển thị tất cả sản phẩm và số lượng đã bán (LEFT JOIN)
select p.product_id,p.product_name, oi.quantity
from products p join order_items oi on oi.product_id = p.product_id

-- Liệt kê tất cả danh mục và số sản phẩm trong mỗi danh mục (LEFT JOIN)
select c.category_id,c.category_name, count(p.product_id) as "Số lượng sản phẩm"
from products p join categories c on c.category_id = p.category_id
group by c.category_id,c.category_name
