--Liệt kê danh sách sản phẩm với tên sản phẩm được đặt ALIAS là "Tên SP", giá được đặt ALIAS là "Đơn giá"
select products.product_name as "Tên SP", price as "Đơn giá" from products

--Tính tổng số khách hàng theo từng thành phố
select city, count(customer_id) as "Tổng số khách hàng"
from customers group by city

--Tìm giá cao nhất, thấp nhất và trung bình của sản phẩm theo từng danh mục
select p.category_id, c.category_name,
max(p.price) as "Giá cao nhất",
Min(p.price) as "Giá thấp nhất",
avg(p.price) as "Giá trung bình" 
from products as p join categories c on c.category_id = p.category_id
group by p.category_id,c.category_name

--Đếm số đơn hàng theo từng trạng thái
select o.status,count(o.order_id) as "Số đơn hàng"
from orders o
group by  o.status
