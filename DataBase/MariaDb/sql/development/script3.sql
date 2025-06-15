CREATE TABLE products_dev (
  id INT AUTO_INCREMENT PRIMARY KEY,
  name varchar(100),
  price DECIMAL(10, 2)
);

INSERT INTO products_dev (name, price) VALUES ('Product 1', 10.10);
INSERT INTO products_dev (name, price) VALUES ('Product 2', 20.25);
INSERT INTO products_dev (name, price) VALUES ('Product 3', 30.30);
