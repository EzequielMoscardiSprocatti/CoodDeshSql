
/*Listar todos Clientes que não tenham realizado uma compra*/
select a.customers_id, a.first_name, 
from customers a 
left join orders b on a.customers_id = b.customers_id
where b.order_id is null;


/*Listar os Produtos que não tenham sido comprados*/
select a.product_id, product_name, a.brand_id
from products a
left join order_items b on a.product_id = b.product_id
where b.product_id is null;


/*Listar os Produtos sem Estoque*/
select a.product_id, a.product_name, a.brand_id
from products a
left join stocks b on a.product_id = b.product_id
where b.quantity = 0 or a.product_id is null


/*Agrupar a quantidade de vendas que uma determinada Marca por Loja.*/
SELECT s.store_id, s.store_name, b.brand_id, b.brand_name, SUM(a.quantity) AS total_vendas
FROM order_item a
JOIN brands b ON c.brand_id = b.brand_id
JOIN products c ON a.product_id = c.product_id
JOIN orders o ON a.order_id = o.order_id
JOIN stores s ON o.store_id = s.store_id
GROUP BY s.store_id, s.store_name, b.brand_id, b.brand_name
ORDER BY s.store_id, b.brand_id;

/*Listar os Funcionarios que não estejam relacionados a um Pedido*/
SELECT a.staff_id, a.first_name
FROM staffs a
LEFT JOIN orders b ON a.staff_id = b.staff_id
WHERE b.order_id IS NULL;

