create database LaptopStore;

use laptopstore;

drop table product;

create table product (
productid int not null auto_increment primary key, -- Unique 5-digit order ID
product_name varchar(100) not null, -- Laptop model name
brand varchar(50) not null, -- Brand name
category enum("Normal", "Gaming", "Business") not null, 
processor varchar(100) not null,
ram varchar(50) not null,
graphics varchar(100) not null,
storage varchar(100) not null,
warranty int not null,
stock int not null,
price decimal(10,2) not null
);

select * from product;

select category, min(price) as Min_Laptop_Price from product group by category;  

INSERT INTO product (product_name, brand, category, processor, ram, graphics, storage, warranty, stock, price)
VALUES
-- Gaming Laptops
('ROG Strix G15', 'ASUS', 'Gaming', 'AMD Ryzen 9 5900HX', '16GB DDR4', 'NVIDIA RTX 3060', '1TB SSD', 2, 15, 120000.00),
('Predator Helios 300', 'Acer', 'Gaming', 'Intel Core i7-11800H', '16GB DDR4', 'NVIDIA RTX 3070', '1TB SSD', 2, 12, 140000.00),
('Legion 5 Pro', 'Lenovo', 'Gaming', 'AMD Ryzen 7 5800H', '16GB DDR4', 'NVIDIA RTX 3060', '512GB SSD', 2, 10, 125000.00),
('Alienware M15 R6', 'Dell', 'Gaming', 'Intel Core i7-11800H', '16GB DDR4', 'NVIDIA RTX 3080', '1TB SSD', 2, 8, 180000.00),
('HP Omen 15', 'HP', 'Gaming', 'AMD Ryzen 7 5800H', '16GB DDR4', 'NVIDIA RTX 3060', '512GB SSD', 3, 20, 110000.00),

-- Business Laptops
('ThinkPad X1 Carbon', 'Lenovo', 'Business', 'Intel Core i7-1165G7', '16GB DDR4', 'Integrated Intel Iris Xe', '1TB SSD', 3, 25, 150000.00),
('MacBook Pro 16', 'Apple', 'Business', 'Apple M1 Pro', '16GB Unified Memory', 'Integrated Apple GPU', '512GB SSD', 3, 30, 200000.00),
('Dell XPS 13', 'Dell', 'Business', 'Intel Core i7-1165G7', '16GB LPDDR4x', 'Integrated Intel Iris Xe', '1TB SSD', 2, 18, 140000.00),
('HP Spectre x360', 'HP', 'Business', 'Intel Core i5-1135G7', '8GB DDR4', 'Integrated Intel Iris Xe', '512GB SSD', 2, 10, 115000.00),
('ASUS ZenBook 14', 'ASUS', 'Business', 'Intel Core i7-1165G7', '16GB LPDDR4x', 'Integrated Intel Iris Xe', '1TB SSD', 3, 12, 130000.00),

-- Normal Laptops
('HP Pavilion 15', 'HP', 'Normal', 'Intel Core i5-1135G7', '8GB DDR4', 'Integrated Intel Iris Xe', '512GB SSD', 1, 40, 75000.00),
('Dell Inspiron 15', 'Dell', 'Normal', 'Intel Core i3-1115G4', '8GB DDR4', 'Integrated Intel UHD', '256GB SSD', 1, 35, 55000.00),
('ASUS VivoBook 15', 'ASUS', 'Normal', 'AMD Ryzen 5 5500U', '8GB DDR4', 'Integrated AMD Radeon', '512GB SSD', 1, 50, 60000.00),
('Lenovo IdeaPad Slim 3', 'Lenovo', 'Normal', 'Intel Core i5-1135G7', '8GB DDR4', 'Integrated Intel Iris Xe', '512GB SSD', 1, 60, 70000.00),
('Acer Aspire 5', 'Acer', 'Normal', 'AMD Ryzen 3 3200U', '4GB DDR4', 'Integrated AMD Radeon Vega', '1TB HDD', 1, 55, 45000.00),

-- More Gaming Laptops
('MSI GP66 Leopard', 'MSI', 'Gaming', 'Intel Core i7-10750H', '16GB DDR4', 'NVIDIA RTX 3070', '512GB SSD', 2, 12, 150000.00),
('Razer Blade 15', 'Razer', 'Gaming', 'Intel Core i7-10875H', '16GB DDR4', 'NVIDIA RTX 2080 Super', '1TB SSD', 2, 5, 200000.00),
('Gigabyte AORUS 15G', 'Gigabyte', 'Gaming', 'Intel Core i7-10870H', '16GB DDR4', 'NVIDIA RTX 3070', '512GB SSD', 2, 8, 160000.00),
('ASUS TUF Dash F15', 'ASUS', 'Gaming', 'Intel Core i7-11370H', '16GB DDR4', 'NVIDIA RTX 3060', '1TB SSD', 2, 14, 130000.00),
('HP Victus 16', 'HP', 'Gaming', 'AMD Ryzen 5 5600H', '8GB DDR4', 'NVIDIA GTX 1650', '512GB SSD', 2, 20, 95000.00),

-- More Business Laptops
('Microsoft Surface Laptop 4', 'Microsoft', 'Business', 'AMD Ryzen 5 4680U', '8GB DDR4', 'Integrated AMD Radeon', '512GB SSD', 3, 15, 120000.00),
('LG Gram 14', 'LG', 'Business', 'Intel Core i7-1065G7', '16GB LPDDR4x', 'Integrated Intel Iris Plus', '512GB SSD', 3, 10, 135000.00),
('ASUS ExpertBook B9', 'ASUS', 'Business', 'Intel Core i7-1165G7', '16GB LPDDR4x', 'Integrated Intel Iris Xe', '1TB SSD', 3, 8, 140000.00),
('Dell Latitude 7420', 'Dell', 'Business', 'Intel Core i5-1135G7', '8GB DDR4', 'Integrated Intel Iris Xe', '512GB SSD', 2, 18, 125000.00),
('Lenovo ThinkPad E14', 'Lenovo', 'Business', 'AMD Ryzen 5 4500U', '8GB DDR4', 'Integrated AMD Radeon', '512GB SSD', 3, 25, 95000.00),

-- More Normal Laptops
('HP 14s', 'HP', 'Normal', 'Intel Core i3-1005G1', '4GB DDR4', 'Integrated Intel UHD', '256GB SSD', 1, 50, 50000.00),
('ASUS Chromebook Flip', 'ASUS', 'Normal', 'Intel Core M3-8100Y', '4GB LPDDR3', 'Integrated Intel UHD', '64GB eMMC', 1, 30, 40000.00),
('Lenovo Flex 5', 'Lenovo', 'Normal', 'AMD Ryzen 5 4500U', '8GB DDR4', 'Integrated AMD Radeon', '512GB SSD', 2, 35, 60000.00),
('Acer Swift 3', 'Acer', 'Normal', 'Intel Core i5-1035G1', '8GB DDR4', 'Integrated Intel UHD', '512GB SSD', 1, 40, 62000.00),
('Dell Vostro 14 3401', 'Dell', 'Normal', 'Intel Core i3-1115G4', '8GB DDR4', 'Integrated Intel UHD', '256GB SSD', 1, 55, 48000.00),

-- More High-end Business Laptops
('HP EliteBook x360', 'HP', 'Business', 'Intel Core i7-1165G7', '16GB DDR4', 'Integrated Intel Iris Xe', '512GB SSD', 3, 10, 155000.00),
('Apple MacBook Air', 'Apple', 'Business', 'Apple M1', '8GB Unified Memory', 'Integrated Apple GPU', '256GB SSD', 3, 45, 120000.00),
('ASUS ProArt StudioBook', 'ASUS', 'Business', 'Intel Xeon W-10885M', '32GB DDR4', 'NVIDIA Quadro RTX 5000', '1TB SSD', 3, 5, 250000.00),
('Dell Precision 5550', 'Dell', 'Business', 'Intel Core i7-10750H', '16GB DDR4', 'NVIDIA Quadro T1000', '1TB SSD', 2, 15, 190000.00),
('Lenovo Yoga C940', 'Lenovo', 'Business', 'Intel Core i7-1065G7', '16GB LPDDR4x', 'Integrated Intel Iris Plus', '512GB SSD', 2, 12, 140000.00);


# Customer Details
CREATE TABLE customers (
    customerid INT NOT NULL AUTO_INCREMENT PRIMARY KEY, -- Unique ID for each customer
    name VARCHAR(100) NOT NULL,                        -- Customer's name
    email VARCHAR(100) NOT NULL,                       -- Customer's email address
    mobile VARCHAR(15) NOT NULL,                       -- Customer's mobile number
    city VARCHAR(50) NOT NULL,                         -- Customer's city
    state VARCHAR(50) NOT NULL,                        -- Customer's state
    password VARCHAR(255) NOT NULL
);

select * from customers;

INSERT INTO customers (name, email, mobile, city, state, password)
VALUES
('Rohan Sharma', 'rohan.sharma@example.com', '9876543210', 'Mumbai', 'Maharashtra', SHA2(CONCAT(MD5(RAND()), '9876543210'), 256)),
('Ayesha Khan', 'ayesha.khan@example.com', '9876543211', 'Delhi', 'Delhi', SHA2(CONCAT(MD5(RAND()), '9876543211'), 256)),
('Vikram Mehra', 'vikram.mehra@example.com', '9876543212', 'Bengaluru', 'Karnataka', SHA2(CONCAT(MD5(RAND()), '9876543212'), 256)),
('Sanya Iyer', 'sanya.iyer@example.com', '9876543213', 'Chennai', 'Tamil Nadu', SHA2(CONCAT(MD5(RAND()), '9876543213'), 256)),
('Neha Gupta', 'neha.gupta@example.com', '9876543214', 'Kolkata', 'West Bengal', SHA2(CONCAT(MD5(RAND()), '9876543214'), 256)),
('Rajesh Singh', 'rajesh.singh@example.com', '9876543215', 'Pune', 'Maharashtra', SHA2(CONCAT(MD5(RAND()), '9876543215'), 256)),
('Preeti Desai', 'preeti.desai@example.com', '9876543216', 'Ahmedabad', 'Gujarat', SHA2(CONCAT(MD5(RAND()), '9876543216'), 256)),
('Amit Patel', 'amit.patel@example.com', '9876543217', 'Surat', 'Gujarat', SHA2(CONCAT(MD5(RAND()), '9876543217'), 256)),
('Ananya Verma', 'ananya.verma@example.com', '9876543218', 'Lucknow', 'Uttar Pradesh', SHA2(CONCAT(MD5(RAND()), '9876543218'), 256)),
('Rahul Nair', 'rahul.nair@example.com', '9876543219', 'Thiruvananthapuram', 'Kerala', SHA2(CONCAT(MD5(RAND()), '9876543219'), 256)),

('Pooja Mishra', 'pooja.mishra@example.com', '9876543220', 'Hyderabad', 'Telangana', SHA2(CONCAT(MD5(RAND()), '9876543220'), 256)),
('Sameer Joshi', 'sameer.joshi@example.com', '9876543221', 'Jaipur', 'Rajasthan', SHA2(CONCAT(MD5(RAND()), '9876543221'), 256)),
('Tina Mathew', 'tina.mathew@example.com', '9876543222', 'Bhopal', 'Madhya Pradesh', SHA2(CONCAT(MD5(RAND()), '9876543222'), 256)),
('Kiran Rao', 'kiran.rao@example.com', '9876543223', 'Chandigarh', 'Chandigarh', SHA2(CONCAT(MD5(RAND()), '9876543223'), 256)),
('Deepak Chawla', 'deepak.chawla@example.com', '9876543224', 'Patna', 'Bihar', SHA2(CONCAT(MD5(RAND()), '9876543224'), 256)),
('Vikas Malhotra', 'vikas.malhotra@example.com', '9876543225', 'Indore', 'Madhya Pradesh', SHA2(CONCAT(MD5(RAND()), '9876543225'), 256)),
('Shreya Das', 'shreya.das@example.com', '9876543226', 'Guwahati', 'Assam', SHA2(CONCAT(MD5(RAND()), '9876543226'), 256)),
('Mohit Arora', 'mohit.arora@example.com', '9876543227', 'Nagpur', 'Maharashtra', SHA2(CONCAT(MD5(RAND()), '9876543227'), 256)),
('Gauri Batra', 'gauri.batra@example.com', '9876543228', 'Ranchi', 'Jharkhand', SHA2(CONCAT(MD5(RAND()), '9876543228'), 256)),
('Nikhil Sinha', 'nikhil.sinha@example.com', '9876543229', 'Vadodara', 'Gujarat', SHA2(CONCAT(MD5(RAND()), '9876543229'), 256)),

('Sonal Jain', 'sonal.jain@example.com', '9876543230', 'Varanasi', 'Uttar Pradesh', SHA2(CONCAT(MD5(RAND()), '9876543230'), 256)),
('Abhinav Kaul', 'abhinav.kaul@example.com', '9876543231', 'Kanpur', 'Uttar Pradesh', SHA2(CONCAT(MD5(RAND()), '9876543231'), 256)),
('Meera Reddy', 'meera.reddy@example.com', '9876543232', 'Visakhapatnam', 'Andhra Pradesh', SHA2(CONCAT(MD5(RAND()), '9876543232'), 256)),
('Manoj Tripathi', 'manoj.tripathi@example.com', '9876543233', 'Ludhiana', 'Punjab', SHA2(CONCAT(MD5(RAND()), '9876543233'), 256)),
('Priya Bhatt', 'priya.bhatt@example.com', '9876543234', 'Agra', 'Uttar Pradesh', SHA2(CONCAT(MD5(RAND()), '9876543234'), 256)),
('Siddharth Dey', 'siddharth.dey@example.com', '9876543235', 'Meerut', 'Uttar Pradesh', SHA2(CONCAT(MD5(RAND()), '9876543235'), 256)),
('Alok Kumar', 'alok.kumar@example.com', '9876543236', 'Amritsar', 'Punjab', SHA2(CONCAT(MD5(RAND()), '9876543236'), 256)),
('Smriti Sengupta', 'smriti.sengupta@example.com', '9876543237', 'Kochi', 'Kerala', SHA2(CONCAT(MD5(RAND()), '9876543237'), 256)),
('Aakash Gupta', 'aakash.gupta@example.com', '9876543238', 'Gwalior', 'Madhya Pradesh', SHA2(CONCAT(MD5(RAND()), '9876543238'), 256)),
('Kavita Kapoor', 'kavita.kapoor@example.com', '9876543239', 'Jamshedpur', 'Jharkhand', SHA2(CONCAT(MD5(RAND()), '9876543239'), 256)),

('Ritika Rao', 'ritika.rao@example.com', '9876543240', 'Madurai', 'Tamil Nadu', SHA2(CONCAT(MD5(RAND()), '9876543240'), 256)),
('Aditya Tiwari', 'aditya.tiwari@example.com', '9876543241', 'Coimbatore', 'Tamil Nadu', SHA2(CONCAT(MD5(RAND()), '9876543241'), 256)),
('Ishita Shah', 'ishita.shah@example.com', '9876543242', 'Shimla', 'Himachal Pradesh', SHA2(CONCAT(MD5(RAND()), '9876543242'), 256)),
('Tarun Mehta', 'tarun.mehta@example.com', '9876543243', 'Jabalpur', 'Madhya Pradesh', SHA2(CONCAT(MD5(RAND()), '9876543243'), 256)),
('Kajal Aggarwal', 'kajal.aggarwal@example.com', '9876543244', 'Jodhpur', 'Rajasthan', SHA2(CONCAT(MD5(RAND()), '9876543244'), 256)),
('Nilesh Pandey', 'nilesh.pandey@example.com', '9876543245', 'Faridabad', 'Haryana', SHA2(CONCAT(MD5(RAND()), '9876543245'), 256)),
('Swati Choudhary', 'swati.choudhary@example.com', '9876543246', 'Ghaziabad', 'Uttar Pradesh', SHA2(CONCAT(MD5(RAND()), '9876543246'), 256)),
('Harish Sharma', 'harish.sharma@example.com', '9876543247', 'Raipur', 'Chhattisgarh', SHA2(CONCAT(MD5(RAND()), '9876543247'), 256)),
('Anil Agarwal', 'anil.agarwal@example.com', '9876543248', 'Pimpri-Chinchwad', 'Maharashtra', SHA2(CONCAT(MD5(RAND()), '9876543248'), 256)),
('Radhika Iyer', 'radhika.iyer@example.com', '9876543249', 'Aurangabad', 'Maharashtra', SHA2(CONCAT(MD5(RAND()), '9876543249'), 256)),

('Pankaj Singh', 'pankaj.singh@example.com', '9876543250', 'Dehradun', 'Uttarakhand', SHA2(CONCAT(MD5(RAND()), '9876543250'), 256)),
('Surbhi Anand', 'surbhi.anand@example.com', '9876543251', 'Noida', 'Uttar Pradesh', SHA2(CONCAT(MD5(RAND()), '9876543251'), 256)),
('Rajiv Sinha', 'rajiv.sinha@example.com', '9876543252', 'Allahabad', 'Uttar Pradesh', SHA2(CONCAT(MD5(RAND()), '9876543252'), 256)),
('Sneha Menon', 'sneha.menon@example.com', '9876543253', 'Udaipur', 'Rajasthan', SHA2(CONCAT(MD5(RAND()), '9876543253'), 256)),
('Uday Sharma', 'uday.sharma@example.com', '9876543254', 'Nashik', 'Maharashtra', SHA2(CONCAT(MD5(RAND()), '9876543254'), 256)),
('Anjali Goel', 'anjali.goel@example.com', '9876543255', 'Karnal', 'Haryana', SHA2(CONCAT(MD5(RAND()), '9876543255'), 256)),
('Vineet Saxena', 'vineet.saxena@example.com', '9876543256', 'Bilaspur', 'Chhattisgarh', SHA2(CONCAT(MD5(RAND()), '9876543256'), 256)),
('Ravi Verma', 'ravi.verma@example.com', '9876543257', 'Siliguri', 'West Bengal', SHA2(CONCAT(MD5(RAND()), '9876543257'), 256)),
('Disha Roy', 'disha.roy@example.com', '9876543258', 'Bhubaneswar', 'Odisha', SHA2(CONCAT(MD5(RAND()), '9876543258'), 256)),
('Manish Kapoor', 'manish.kapoor@example.com', '9876543259', 'Kozhikode', 'Kerala', SHA2(CONCAT(MD5(RAND()), '9876543259'), 256));

UPDATE customers
SET password = SHA2('testpassword', 256)
WHERE customerid = 1;

UPDATE customers
SET password = SHA2('testpassword1234', 256)
WHERE customerid = 13;

UPDATE customers
SET password = SHA2('12345678', 256)
WHERE customerid = 18;

UPDATE customers
SET password = SHA2('PassWord123!', 256)
WHERE customerid = 24;

UPDATE customers
SET password = SHA2('WhoAmI!', 256)
WHERE customerid = 42;

UPDATE customers
SET password = SHA2('Iamrobot24!', 256)
WHERE customerid = 11;

UPDATE customers
SET password = SHA2('Mahi7', 256)
WHERE customerid = 7;

UPDATE customers
SET password = SHA2('Hittu45', 256)
WHERE customerid = 45;

select * from customers;

drop table customers;

ALTER TABLE customers ADD COLUMN password VARCHAR(255);





# Transaction table
CREATE TABLE transactions (
    transactionid INT NOT NULL AUTO_INCREMENT PRIMARY KEY,  -- Unique transaction ID
    customerid INT NOT NULL,                                -- Foreign key to customers table
    productid INT NOT NULL,                                 -- Foreign key to product table
    purchase_date DATE NOT NULL,                            -- Purchase date
    payment_type VARCHAR(10) NOT NULL,                      -- Full or EMI payment
    emi_plan VARCHAR(10) DEFAULT 'Nil',                     -- EMI plan (months) or 'Nil'
    quantity INT NOT NULL,                                  -- Quantity of products purchased
    delivery_status VARCHAR(20) NOT NULL,                   -- Delivery status (Pending, Shipped, Delivered)
    delivery_date DATE DEFAULT NULL,                        -- Delivery date (if delivered)
    FOREIGN KEY (customerid) REFERENCES customers(customerid), -- Foreign key constraint to customers table
    FOREIGN KEY (productid) REFERENCES product(productid)    -- Foreign key constraint to product table
);

INSERT INTO transactions (customerid, productid, purchase_date, payment_type, emi_plan, quantity, delivery_status, delivery_date)
VALUES
(11, 32, '2023-09-01', 'Full', 'Nil', 1, 'Delivered', '2023-09-05'),
(32, 2, '2023-09-02', 'EMI', '12', 1, 'Pending', NULL),
(13, 13, '2023-09-05', 'Full', 'Nil', 2, 'Delivered', '2023-09-10'),
(7, 24, '2023-09-06', 'EMI', '6', 1, 'Shipped', NULL),
(45, 5, '2023-09-07', 'Full', 'Nil', 1, 'Delivered', '2023-09-12'),
(3, 10, '2023-09-08', 'EMI', '24', 1, 'Pending', NULL),
(18, 17, '2023-09-10', 'Full', 'Nil', 3, 'Delivered', '2023-09-15'),
(24, 8, '2023-09-11', 'EMI', '12', 1, 'Shipped', NULL),
(6, 24, '2023-09-12', 'Full', 'Nil', 2, 'Delivered', '2023-09-17'),
(10, 15, '2023-09-13', 'EMI', '18', 1, 'Pending', NULL);

select * from transactions;