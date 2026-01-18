--Gộp danh sách email từ bảng customers và một danh sách email marketing
select email from customers 
union 
select email from marketing

--Tìm khách hàng vừa mua sản phẩm category 'Electronics' vừa mua 'Books'
select cu.customer_name from customers cu join orders o on o.customer_id = cu.customer_id
join order_items ot on ot.order_id = o.order_id 
join products p on p.product_id = ot.product_id
join categories ca on ca.category_id = p.category_id
where ca.category_name='Electronics'
union 
select cu.customer_name from customers cu join orders o on o.customer_id = cu.customer_id
join order_items ot on ot.order_id = o.order_id 
join products p on p.product_id = ot.product_id
join categories ca on ca.category_id = p.category_id
where ca.category_name='Books'

-- So sánh danh sách sản phẩm bán chạy tháng này và tháng trước
(
    SELECT p.product_id, p.product_name
    FROM orders o
    JOIN order_items oi ON o.order_id = oi.order_id
    JOIN products p ON oi.product_id = p.product_id
    WHERE DATE_TRUNC('month', o.order_date) = DATE_TRUNC('month', CURRENT_DATE)
    GROUP BY p.product_id, p.product_name
    HAVING SUM(oi.quantity) > 50
)
INTERSECT
(
    SELECT p.product_id, p.product_name
    FROM orders o
    JOIN order_items oi ON o.order_id = oi.order_id
    JOIN products p ON oi.product_id = p.product_id
    WHERE DATE_TRUNC('month', o.order_date) = DATE_TRUNC('month', CURRENT_DATE - INTERVAL '1 month')
    GROUP BY p.product_id, p.product_name
    HAVING SUM(oi.quantity) > 50
);

--Tìm khách hàng có ở cả hai thành phố Hà Nội và TP.HCM (giả sử có bảng customer_addresses)

select * from customers where city='Hà Nội'
intersect 
select * from customers where city='TP.HCM'

