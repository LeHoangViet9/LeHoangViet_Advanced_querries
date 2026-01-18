-- Tìm các khách hàng có từ 3 đơn hàng trở lên
select c.customer_name, count(o.order_id) as "Số đơn hàng"
from orders o join customers c on o.customer_id = c.customer_id
group by c.customer_name
having count(o.order_id)>=3

--Liệt kê các danh mục có tổng số lượng sản phẩm tồn kho > 100
select c.category_name, count(p.stock_quantity) as "Số lượng tồn kho" 
from products p join categories c on p.category_id = c.category_id
group by c.category_name
having count(p.stock_quantity) > 100

--Tìm các thành phố có số khách hàng >= 5
select c.city, count(*) from customers c 
group by c.city
having count(*)>=5

-- Liệt kê các sản phẩm có tổng số lượng bán ra > 50
select p.product_name, sum(oi.quantity) as "Số lượng bán ra" from order_items oi join products p on oi.product_id = p.product_id
group by p.product_name
having sum(oi.quantity) >50

