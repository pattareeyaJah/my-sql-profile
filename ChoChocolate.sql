create DATABASE ChoChocolate
CREATE TABLE customer (
    customer_id VARCHAR (10) PRIMARY KEY,
    age INT,
    gender VARCHAR (10) ,
    loyalty_member INT,
    join_date DATE
);

INSERT Into customer (customer_id , age , gender , loyalty_member, join_date) VALUES
('a001', '40', 'male', '1', '2025-01-25'),
('a002', '47', 'female', '0', '2021-12-26'),
('a003', '58', 'female', '1', '2022-09-13'),
('a004', '25', 'female', '0', '2025-02-27'),
('a005', '43', 'male', '0', '2023-08-31'),
('a006', '32', 'male', '0', '2022-05-22'),
('a007', '51', 'male', '1', '2024-07-24'),
('a008', '56', 'female', '0', '2024-12-24'),
('a009', '18', 'male', '0', '2025-06-23'),
('a010', '40', 'male', '0', '2023-07-06');


CREATE TABLE products (
    product_id VARCHAR (10) PRIMARY KEY,
    product_name VARCHAR (100),
    brand VARCHAR (100) ,
    category VARCHAR (100) ,
    cocoa_percent INT,
    weight_g INT   
);

INSERT Into products (product_id, product_name , brand, category, cocoa_percent,weight_g ) VALUES
('p0001', 'White Chocolate','Mars','Truffle','80','120'),
('p0002', 'Dark Chocolate','Cadbury','Praline','70','100'),
('p0003', 'Truffle Chocolate','Hershey','Praline','70','120'),
('p0004', 'Milk Chocolate','Mars','Praline','50','80'),
('p0005', 'White Chocolate','Ferrero','White','70','50'),
('p0006', 'Milk Chocolate','Hershey','Dark','50','50'),
('p0007', 'Praline Chocolate','Cadbury','Praline','70','120'),
('p0008', 'White Chocolate','Godiva','Dark','90','100'),
('p0009', 'White Chocolate','Ferrero','Dark','50','80'),
('p0010', 'Milk Chocolate','Hershey','Truffle','70','50');

CREATE table Sales (
    ORDER_id VARCHAR (10) PRIMARY KEY,
    ORDER_date DATE,
    Product_id VARCHAR (100),
    Store_id VARCHAR (100),
     customer_id VARCHAR (100),
     Quantity INT,
     Unit_price DECIMAL,
     Discount DECIMAL,
     Revenue DECIMAL,
     Cost DECIMAL,
     Profit DECIMAL
);

ALTER TABLE Sales
ALTER COLUMN Unit_price DECIMAL(10,2);

ALTER TABLE Sales
ALTER COLUMN Discount DECIMAL(10,2);

ALTER TABLE Sales
ALTER COLUMN Revenue DECIMAL(10,2);

ALTER TABLE Sales
ALTER COLUMN Cost DECIMAL(10,2);

ALTER TABLE Sales
ALTER COLUMN Profit DECIMAL(10,2);


INSERT INTO Sales (ORDER_id, ORDER_date, Product_id, Store_id, customer_id, Quantity, Unit_price, Discount,
  Revenue, Cost, Profit  ) VALUES
  ('0RD0000001','2023-07-01','p0080','S093','C040749','5','14.43',
  '0.15','61.33','42.77','18.56'),
  ('0RD0000002','2023-10-22','p0173','S065','C020161','3','12.01',
  '0','36.03','19.06','16.97'),
  ('0RD0000003','2023-07-05','p0115','S078','C048069','2','10.02',
  '0','20.04','10.29','9.75'),
  ('0RD0000004','2024-06-23','p0186','S088','C047901','2','14.66',
  '0.1','26.39','16.35','10.04'),
  ('0RD0000005','2024-09-24','p0197','S054','C03950','1','12.34',
  '0','12.34','7.94','4.4'),
  ('0RD0000006','2024-03-29','p0160','S089','C08918','4','13.52',
  '0','54.08','36.59','17.49'),
  ('0RD0000007','2023-02-26','p0062','S024','C002897','1','11.97',
  '0.1','10.77','7.16','3.61'),
  ('0RD0000008','2023-03-11','p0111','S085','C038072','5','4.62',
  '0','23.1','16.15','6.96'),
  ('0RD0000009','2024-11-10','p0135','S029','C003786','4','7.88',
  '0','31.52','19.9','11.62'),
  ('0RD0000010','2023-12-17','p0069','S056','C043148','3','8.88',
  '0','26.64','18.19','8.45');

CREATE TABLE Stores (
    Store_id VARCHAR (10) PRIMARY KEY,
    Store_name VARCHAR (100),
    City VARCHAR (100),
    Country VARCHAR (100),
    Store_type VARCHAR (100)
);

INSERT INTO Stores (Store_id, Store_name, City, Country, Store_type) VALUES
('S001','Chocolate Store 1', 'New York','Canada','Retail'),
('S002','Chocolate Store 2', 'Melbourne','Canada','Mall'),
('S003','Chocolate Store 3', 'Berlin','France','Mall'),
('S004','Chocolate Store 4', 'Paris','UK','Airport'),
('S005','Chocolate Store 5', 'Sydney','USA','Online'),
('S006','Chocolate Store 6', 'Toronto','Canada','Online'),
('S007','Chocolate Store 7', 'Sydney','France','Mall'),
('S008','Chocolate Store 8', 'Paris','UK','Mall'),
('S009','Chocolate Store 9', 'Paris','France','Online'),
('S010','Chocolate Store 10', 'Toronto','UK','Retail');


UPDATE Sales
SET Product_id = CASE
WHEN Product_id = 'p0080' THEN 'p0001'
WHEN  Product_id = 'p0173' THEN 'p0002'
WHEN  Product_id = 'p0115' THEN 'p0003'
WHEN  Product_id = 'p0186' THEN 'p0004'
WHEN  Product_id = 'p0197' THEN 'p0005'
WHEN  Product_id = 'p0160' THEN 'p0006'
WHEN  Product_id = 'p0062' THEN 'p0007'
WHEN  Product_id = 'p0111' THEN 'p0008'
WHEN  Product_id = 'p0135' THEN 'p0009'
WHEN  Product_id = 'p0069' THEN 'p0010'
ELSE product_id
END;

UPDATE Sales
SET customer_id = CASE
WHEN customer_id = 'C040749' THEN 'a001'
WHEN  customer_id = 'C020161' THEN 'a002'
WHEN  customer_id = 'C048069' THEN 'a003'
WHEN  customer_id = 'C047901' THEN 'a004'
WHEN  customer_id = 'C03950' THEN 'a005'
WHEN  customer_id = 'C08918' THEN 'a006'
WHEN  customer_id = 'C002897' THEN 'a007'
WHEN  customer_id = 'C038072' THEN 'a008'
WHEN  customer_id = 'C003786' THEN 'a009'
WHEN  customer_id = 'C043148' THEN 'a010'
ELSE customer_id
END;

UPDATE Sales
SET store_id = CASE
WHEN store_id= 'S093' THEN 'S001'
WHEN  store_id = 'S065' THEN 'S002'
WHEN  store_id = 'S078' THEN 'S003'
WHEN  store_id = 'S088' THEN 'S004'
WHEN  store_id = 'S054' THEN 'S005'
WHEN  store_id = 'S089' THEN 'S006'
WHEN  store_id = 'S024' THEN 'S007'
WHEN  store_id = 'S085' THEN 'S008'
WHEN  store_id = 'S029' THEN 'S009'
WHEN  store_id = 'S056' THEN 'S010'
ELSE store_id
END;

ALTER TABLE Sales
ALTER COLUMN customer_id VARCHAR(10);

ALTER TABLE Sales
ALTER COLUMN product_id VARCHAR(10);

ALTER TABLE Sales
ALTER COLUMN store_id VARCHAR(10);


--ALTER TABLE Sales 
--Add CONSTRAINT fk_product
--FOREIGN KEY (product_id) REFERENCES products (product_id);

--ALTER TABLE sales
--ADD CONSTRAINT fk_customer
--FOREIGN KEY (customer_id) REFERENCES customer (customer_id);

--ALTER TABLE sales
--ADD CONSTRAINT fk_store
--FOREIGN KEY (Store_id) REFERENCES stores (Store_id);----

ALTER TABLE Sales
DROP CONSTRAINT fk_product;

ALTER TABLE Sales 
Add CONSTRAINT fk_product
FOREIGN KEY (product_id) REFERENCES products (product_id);

ALTER TABLE sales
ADD CONSTRAINT fk_customer
FOREIGN KEY (customer_id) REFERENCES customer (customer_id);

ALTER TABLE sales
ADD CONSTRAINT fk_store
FOREIGN KEY (Store_id) REFERENCES stores (Store_id);

SELECT *
FROM Sales
WHERE customer_id NOT IN (
    SELECT customer_id FROM customer
);

DELETE FROM Sales
WHERE customer_id NOT IN (
    SELECT customer_id FROM customer
);


SELECT 
s.order_id, c.gender, p.product_name,
st.city, s.Revenue
FROM Sales s
JOIN customer c on s.customer_id = c.customer_id
JOIN Products p on s.product_id = p.product_id
JOIN Stores st ON s.Store_id = st.store_id;

ยอดขาย

SELECT 
p.product_name,
SUM(s.Revenue) AS Total_Revenue
FROM Sales s
JOIN products p ON s.Product_id = p.product_id
GROUP BY p.product_name
ORDER BY Total_Revenue DESC;

CREATE VIEW sales_summary AS
SELECT 
    p.product_name,
    SUM(s.Revenue) AS total_revenue
FROM Sales s
JOIN products p ON s.product_id = p.product_id
GROUP BY p.product_name;