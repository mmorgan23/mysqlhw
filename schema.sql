CREATE DATABASE  bamazon;
USE bamazon;

CREATE TABLE products (
 item_id INT AUTO_INCREMENT NOT NULL,
  product_name VARCHAR(45) NOT NULL,
  product_sales DECIMAL(10,2) NOT NULL,
  department_name VARCHAR(45) NOT NULL,
  price DECIMAL(10,2) NOT NULL,
  stock_quantity INT(10) NOT NULL,
  primary key(item_id)
);


INSERT INTO products (product_name, product_sales, department_name, price, stock_quantity)
VALUES ("Screen Protector", 0, "Phone", 14.99, 200),
  ("iPhone Charger", 0, "Phone", 19.99, 125),
  ("Body Cream", 0, "Beauty", 21.00, 50),
  ("Eye Cream", 0, "Beauty", 35.00, 29),
  ("The Trials of Apollo", 0, "Books", 16.80, 100),
  ("Thirteen Reasons Why", 0, "Books", 15.57, 100),
  ("Crocs", 0, "Clothing", 23.00, 110),
  ("Hanes T-Shirt", 0, "Clothing", 13.45, 127),
  ("Sniper", 0, "Video Games", 39.99, 55),
  ("Halo", 0, "Video Games", 39.99, 56);

 CREATE TABLE departments(
  department_id INT AUTO_INCREMENT NOT NULL,
  department_name VARCHAR(45) NOT NULL,
  over_head_costs DECIMAL(10,2) NOT NULL,
  total_sales DECIMAL(15,2) NOT NULL,
  primary key(department_id)
);

select * from departments;

INSERT INTO departments (department_name, over_head_costs, total_sales)
VALUES ("Phone", 300, 400),
  ("Beauty", 100, 250),
  ("Books", 75, 300),
  ("Clothing", 235, 50),
  ("Video Games", 135, 500);
