DROP DATABASE IF EXISTS webbshop;
CREATE DATABASE webbshop;
USE webbshop;


CREATE TABLE customer (
	customer_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
	first_name VARCHAR(50) NOT NULL,
	last_name VARCHAR(50) NOT NULL,
	phone_number VARCHAR(15) NOT NULL,
	email VARCHAR(50) NOT NULL UNIQUE,
	country VARCHAR(50) NOT NULL,
	city VARCHAR(50) NOT NULL,
	state VARCHAR(50),
	zip VARCHAR(10) NOT NULL,
	street VARCHAR(50)
	
	);


CREATE TABLE orders(
    order_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    customer_id INT NOT NULL,
    order_date DATE NOT NULL,
    CONSTRAINT fk_customer_order
    FOREIGN KEY (customer_id) REFERENCES customer(customer_id)
    ON DELETE RESTRICT
    ON UPDATE CASCADE
);


CREATE TABLE product(
	product_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
	brand VARCHAR(50),
	size VARCHAR(50),
	color VARCHAR(50),
	name VARCHAR(50) UNIQUE,
	stock_quantity INT,
	price DECIMAL(10, 2)

	);

CREATE INDEX idx_product_name ON product(name);


CREATE TABLE orderProduct (
	orderProduct_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    	order_id INT NOT NULL,
    	product_id INT NOT NULL,
    	quantity INT,
    	total_price DECIMAL(10,2),
    	CONSTRAINT fk_order_product 
    		FOREIGN KEY (order_id) 
    		REFERENCES orders(order_id)
    	ON DELETE CASCADE
    	ON UPDATE CASCADE,
    		CONSTRAINT fk_product_order 
    		FOREIGN KEY (product_id) 
    		REFERENCES product(product_id)
    	ON DELETE RESTRICT
    	ON UPDATE CASCADE
);

CREATE TABLE category(
	category_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
	category_name VARCHAR(50) UNIQUE
	
	);

CREATE TABLE productCategory(
	productCategory_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
	product_id INT NOT NULL,
	category_id INT NOT NULL,
	FOREIGN KEY (product_id) REFERENCES product(product_id),
	FOREIGN KEY (category_id) REFERENCES category(category_id),
    	UNIQUE(product_id, category_id)
	);

-- from down below we will add data into the tables

INSERT INTO customer(first_name, last_name, phone_number, email, country, city, state, zip, street) VALUES
	('Pettson' , 'Findus' , '1234567' , 'petsson@sweden.com' , 'Sweden' , 'Stockholm' , 'Solna' , '12412' , 'Karolinsklavägen 2'),
	('Astrid' , 'Lindgren' , '11223344' , 'astrid@finland.com' , 'Finland' , 'Helsingfors' , 'Helsinki' , '41254', 'Sveavägen 3'),
	('Pippi' , 'Långstrump' , '7654321' , 'pippi@danmark.com' , 'Danmark' , 'Köpenhamn' , 'Zeeland' , '54662' , 'Trondheimsgatan 3'),
	('Nalle' , 'Björn' , '7634565' , 'nalle@island.com' , 'Island' , 'Reykjavik' , 'Vik' , '12446' , 'Kallvägen 2'),
	('Emil' , 'Lönneberga' , '1111111' , 'emil@polen.com' , 'Polen' , 'Warszawa' , 'Lodzkie' , '45621' , 'Vimmebry 43');

INSERT INTO orders(customer_id, order_date) VALUES
   	(1, '2024-09-01'),
 	(2, '2024-09-14'),
	(3, '2024-01-01'),
	(4, '2024-04-20'),
	(5, '2024-05-10'),
	(1, '2024-06-01');

INSERT INTO product(brand, size, color, name, stock_quantity, price) VALUES
	('Nike' , 'medium' , 'black' , 'club' , 32 , 50),
	('Adidas' , 'large' , 'blue', 'strecher', 42 , 100),
	('Asics' , '35' , 'red', 'feather' , 11 , 150),
	('Levis' , '32/32' , 'night-shine' , '502 Regular Taper' , 122 , 200),
	('Champion' , '34' , 'white-black' , 'New Court' , 22 , 250),
	('Gucci' , 'X-Large' , 'white' , 'Gucci-Logo' , 11, 300),
	('sweetpants' , '38' , 'navy' , 'streachy' , 43 , 350),
	('h&m' , 'medium' , 'black&white' , 'skjorta' , 432 , 400);

INSERT INTO orderProduct(order_id, product_id, quantity, total_price) VALUES
	(1, 2, 2, 200),
	(1, 6, 1, 350),
	(2, 1, 1, 50),
	(2, 8, 2, 350),
	(3, 3, 1, 150),
	(4, 4, 2, 400),
	(4, 7, 1, 100),
	(5, 5, 1, 350),
	(6, 2, 1, 100);


INSERT INTO category(category_name) VALUES
	('shirt'),
	('shoe'),
	('pants'),
	('socks'),
	('joggers');

INSERT INTO productCategory(product_id, category_id) VALUES
	(1, 5),
	(2, 1),
	(3, 2),
	(4, 3),
	(5, 4),
	(6, 1),
	(6, 3),
	(8, 1);


select * from customer;
select * from orders;
select * from product;
select * from orderProduct;
select * from category;
select * from productCategory;