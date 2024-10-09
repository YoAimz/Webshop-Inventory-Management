SELECT DISTINCT c.first_name, c.last_name 
	FROM customer c
        	INNER JOIN orders o 
			ON c.customer_id = o.customer_id
        	INNER JOIN orderProduct op 
			ON o.order_id = op.order_id
        	INNER JOIN product p 
			ON op.product_id = p.product_id
        	WHERE p.brand = 'sweetpants' AND p.size = '38' AND p.color = 'navy';


SELECT c.category_name, COUNT(pc.product_id) AS 'Product per Category' 
        FROM category c
        	LEFT JOIN productCategory pc 
			ON c.category_id = pc.category_id
        	GROUP BY c.category_name;


SELECT c.first_name, c.last_name, 
	COALESCE(SUM(op.total_price), 0) AS 'Sum money per customer'
        FROM customer c
        	LEFT JOIN orders o 
			ON c.customer_id = o.customer_id
        	LEFT JOIN orderProduct op 
			ON o.order_id = op.order_id
        GROUP BY c.customer_id;

   
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
        SELECT DISTINCT c.first_name, c.last_name 
        FROM customer c
        INNER JOIN orders o 
		ON c.customer_id = o.customer_id
        INNER JOIN orderProduct op 
		ON o.order_id = op.order_id
        INNER JOIN product p ON op.product_id = p.product_id
        WHERE p.brand = 'sweetpants' AND p.size = '38' AND p.color = 'navy';


        SELECT c.category_name, COUNT(pc.product_id) AS 'Product per Category' 
        	FROM category c
        	INNER JOIN productCategory pc 
		ON c.category_id = pc.category_id
        GROUP BY c.category_name;

        SELECT c.first_name, c.last_name, 
               SUM(op.total_price) AS 'Sum money per customer'
        	FROM customer c
        	INNER JOIN orders o 
			ON c.customer_id = o.customer_id
        	INNER JOIN orderProduct op 
			ON o.order_id = op.order_id
        GROUP BY c.customer_id;








