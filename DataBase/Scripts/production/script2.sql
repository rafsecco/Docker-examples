CREATE TABLE orders (
  id INT PRIMARY KEY,
  user_id INT,
  total DECIMAL(10, 2),
  FOREIGN KEY (user_id) REFERENCES users(id)
);

INSERT INTO orders (id, user_id, total) VALUES (1, 1, 99.99);
