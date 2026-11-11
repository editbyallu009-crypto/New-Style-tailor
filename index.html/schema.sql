-- Sirf dekhne/samajhne ke liye. App ye tables apne aap bana leta hai.
CREATE DATABASE IF NOT EXISTS tailor_shop;
USE tailor_shop;

CREATE TABLE IF NOT EXISTS customers (
  customer_id INT AUTO_INCREMENT PRIMARY KEY,
  name        VARCHAR(100) NOT NULL,
  phone       VARCHAR(15)  NOT NULL UNIQUE,
  address     VARCHAR(255),
  created_at  DATE
);

CREATE TABLE IF NOT EXISTS price_list (
  item_type  VARCHAR(50) PRIMARY KEY,
  base_price INT NOT NULL DEFAULT 0
);

CREATE TABLE IF NOT EXISTS extras (
  extra_name  VARCHAR(50) PRIMARY KEY,
  extra_price INT NOT NULL DEFAULT 0
);

CREATE TABLE IF NOT EXISTS orders (
  order_id      INT AUTO_INCREMENT PRIMARY KEY,
  customer_id   INT NOT NULL,
  item_type     VARCHAR(50) NOT NULL,
  extras        VARCHAR(255),
  design_photo  VARCHAR(255),
  notes         TEXT,
  base_price    INT NOT NULL DEFAULT 0,
  extras_price  INT NOT NULL DEFAULT 0,
  total_price   INT NOT NULL DEFAULT 0,
  advance_paid  INT NOT NULL DEFAULT 0,
  status        ENUM('Received','Cutting','Stitching','Ready','Delivered') NOT NULL DEFAULT 'Received',
  order_date    DATE,
  delivery_date DATE NULL,
  FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);

CREATE TABLE IF NOT EXISTS measurements (
  measurement_id INT AUTO_INCREMENT PRIMARY KEY,
  order_id INT NOT NULL,
  chest DECIMAL(5,2) NULL, waist DECIMAL(5,2) NULL, hip DECIMAL(5,2) NULL,
  shoulder DECIMAL(5,2) NULL, sleeve DECIMAL(5,2) NULL, length DECIMAL(5,2) NULL,
  neck DECIMAL(5,2) NULL, thigh DECIMAL(5,2) NULL,
  FOREIGN KEY (order_id) REFERENCES orders(order_id)
);
