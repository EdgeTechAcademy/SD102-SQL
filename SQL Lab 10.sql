USE dali;

DROP DATABASE dali;

CREATE DATABASE dali;

USE dali;

CREATE TABLE orders (
  order_id INT NOT NULL AUTO_INCREMENT,
  customer_id INT NULL,
  delivery_address_id INT NULL,
  order_date DATE NULL,
  total DECIMAL(13,4) NULL,
  tax DECIMAL(13,4) NULL,
  PRIMARY KEY (order_id)
);



CREATE TABLE products (
  product_id INT NOT NULL AUTO_INCREMENT,
  category_id INT NULL,
  name VARCHAR(50) NULL,
  description VARCHAR(100) NULL,
  price DECIMAL(13,4) NULL,
  image_path VARCHAR(50) NULL,
  PRIMARY KEY (product_id)
);


CREATE TABLE order_items (
  item_id INT NOT NULL AUTO_INCREMENT,
  order_id INT NULL,
  product_id INT NULL,
  sell_price DECIMAL(13,4) NULL,
  PRIMARY KEY (item_id),
  foreign key (product_id) references products(product_id),
  foreign key (order_id) references orders(order_id)
);

CREATE TABLE categories (
  category_id INT NOT NULL AUTO_INCREMENT,
  name VARCHAR(50) NULL,
  description VARCHAR(100) NULL,
  PRIMARY KEY (category_id)
);

alter table products
add foreign key (category_id)
references categories(category_id);

CREATE TABLE customers (
  customer_id INT NOT NULL AUTO_INCREMENT,
  first_name VARCHAR(30) NULL,
  last_name VARCHAR(30) NULL,
  address1 VARCHAR(50) NULL,
  address2 VARCHAR(50) NULL,
  address3 VARCHAR(50) NULL,
  city CHAR(30) NULL,
  state CHAR(2) NULL,
  zip CHAR(5) NULL,
  phone CHAR(20) NULL,
  email VARCHAR(30) NULL,
  PRIMARY KEY (customer_id),
  UNIQUE KEY `email_UNIQUE` (`email`)
);

CREATE TABLE delivery_address (
  delivery_address_id INT NOT NULL AUTO_INCREMENT,
  first_name CHAR(30) NOT NULL,
  last_name CHAR(30) NOT NULL,
  address1 VARCHAR(50) NOT NULL,
  address2 VARCHAR(50) NULL,
  address3 VARCHAR(50) NULL,
  city CHAR(30) NOT NULL,
  state CHAR(2) NOT NULL,
  zip CHAR(5) NOT NULL,
  phone CHAR(20) NULL,
  email VARCHAR(30) NULL,
  PRIMARY KEY (delivery_address_id),
  UNIQUE KEY `email_UNIQUE` (`email`)
);

alter table orders
add foreign key (customer_id)
references customers(customer_id);

alter table orders
add foreign key (delivery_address_id)
references delivery_address(delivery_address_id);
