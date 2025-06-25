CREATE TABLE products_dev (
  id INT PRIMARY KEY,
  name varchar(100),
  price DECIMAL(10, 2)
);

INSERT INTO products_dev (id, name, price) VALUES (1, 'Product 1', 10.10);
INSERT INTO products_dev (id, name, price) VALUES (2, 'Product 2', 20.25);
INSERT INTO products_dev (id, name, price) VALUES (3, 'Product 3', 30.30);
