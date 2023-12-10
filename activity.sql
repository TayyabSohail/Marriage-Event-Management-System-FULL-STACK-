create database project ; 
use project ; 
 drop database project;
UPDATE your_table SET column1 = ?, column2 = ? WHERE condition_column = ? ; 
update  Customer set Account_bal = 10000000000 where Id = 'CUS-12';


Create table Registration (
 User_ID varchar(50) primary key , 
 password varchar(50)

);
CREATE TABLE Customer (
    Id varchar(50) primary key,
    Name varchar(50) ,
    CNIC varchar(50) ,
    Account_Bal DOUBLE,
    Contact varchar(50)
    ); 
CREATE TABLE Admin (
    Id varchar(50) primary key,
    Name varchar(50) ,
    CNIC varchar(50) ,
    Contact varchar(50)
    
);
CREATE TABLE Vendor (
    ID varchar(50) primary key,
    Name varchar(50) ,
    Account_Bal DOUBLE,
    CNIC varchar(50) ,
    Contact varchar(50)
);
CREATE TABLE Portfolio (
	pof_id varchar(50) primary key, 
    ven_id varchar(50) , 
    city varchar(50),
   pricing double, 
   description varchar(50), 
   capacity int , 
   business_name varchar(50) , 
   Type varchar(50),    
    FOREIGN KEY (ven_id) REFERENCES Vendor(ID)
);
CREATE TABLE Orders (
	pof_id varchar(50) , 
    order_id varchar(50) primary key, 
      delivery_date DATE,
    cus_id  varchar(50),
   order_details varchar(50),
    is_active ENUM('PENDING', 'COMPLETED'),    -- ENUM is used instad of boolean and does not support null values
  --  description varchar(50), 
   required_cap int , 
   orderbill double,
   Type varchar(50),    
    FOREIGN KEY (pof_id) REFERENCES Portfolio(pof_id)
);
CREATE TABLE Payment (
	payment_id varchar(50) primary key, 
    payment_amount double,
    payment_status enum("COMPLETED","PENDING") ,    -- ENUM is used instad of boolean and does not support null values
	payment_details varchar(50),
    order_id varchar(50) ,
   
    FOREIGN KEY (order_id) REFERENCES Orders(order_id)
);
CREATE TABLE Feedback (
    order_id varchar(50),
    customer_id varchar(50),
    comment varchar(255),  -- the actual feedback
    stars int,             -- the rating stars
    FOREIGN KEY (order_id) REFERENCES Orders(order_id),
    FOREIGN KEY (customer_id) REFERENCES Customer(Id),
    PRIMARY KEY (order_id, customer_id)
);


drop table Feedback
-- _______________________________________________________________________________________________________________________________________________

INSERT INTO Vendor (Id, Name, Account_bal, CNIC , Contact)
VALUES
    ('VEN-1', 'Abdullah', 500 ,'12345678', '666-2345'),
    ('VEN-2', 'Tayyab', 700 ,'9101112134', '234-5679');
    
-- Insert dummy data into Payment table


INSERT INTO REGISTRATION(User_Id , password)
values ("CUS-12","123"),
("CUS-13","124"),
("VEN-1","125"),
("VEN-2", "126");



-- Insert dummy data into Customer table
INSERT INTO Customer (Id, Name, CNIC, Account_Bal, Contact)
VALUES
    ('CUS-12', 'John Doe', '123456789012345', 1000.0, '123-456-7890'),
    ('CUS-13', 'Jane Smith', '987654321098765', 500.0, '987-654-3210');

-- Insert dummy data into Admin table
INSERT INTO Admin (Id, Name, CNIC, Contact)
VALUES
    ('ADM-1', 'Ali Umer', '999988887777666', '555-1234'),
    ('ADM-2', 'Umair', '111122223334445', '123-4567');
  

-- Insert dummy data into Portfolio table

INSERT INTO Portfolio (pof_id, ven_id,city ,pricing, description, capacity, business_name, Type)
VALUES
    ('POF-1', 'VEN-1','Karachi' ,500.0, 'SUIIIIII', 500, 'Business 1', 'Marriage-Hall'),
    ('POF-2', 'VEN-2','Lahore' ,700.0, 'BLAAAHHHH SUKHAAAAAAAAA', 1000, 'Business 2', 'Catrers'),
    ('POF-3', 'VEN-2','Karachi' ,600.0, 'ZAINAB KE PAPA ZAINAB KE PAPA', 2500, 'Business 3', 'Catrers'),
     ('POF-4', 'VEN-1','Islamabad' ,500.0, 'HAMOOOT', 5000, 'Business 1', 'Marriage-Hall');
     
     
-- Insert dummy data into Orders table

    select * from feedback
INSERT INTO Feedback (order_id, customer_id, comment, stars)
VALUES
    ('ORD-1', 'CUS-12', 'Great service and communication!', 5),
    ('ORD-2', 'CUS-12', 'Satisfied with the product quality.', 4),
    ('ORD-3', 'CUS-13', 'Timely delivery and professional service.', 5);

INSERT INTO Orders (pof_id, order_id, delivery_date ,cus_id,order_details, is_active,  required_cap, Type, orderbill)
  VALUES  ('POF-1', 'ORD-1','2023-11-24' ,'CUS-12' ,'Order 1 Details', 'PENDING', 5, 'Marriage-Hall', 9000),
('POF-2', 'ORD-2','2023-12-11' ,'CUS-12','Order 2 Details', 'COMPLETED', 8, 'Caterers' , 10000),
('POF-3', 'ORD-3','2023-11-27' ,'CUS-13' ,'Order 3 Details', 'PENDING',  7,  'Caterers' , 11000);
    
    -- orderbilll is not shown check the place order use case
    INSERT INTO Payment (payment_id, order_id, payment_amount, payment_status, payment_details)
VALUES
    ('PAY-1', 'ORD-1', 900.0, 'COMPLETED', 'Payment Details 1'),
    ('PAY-2', 'ORD-3', 1000.0, 'PENDING', 'Payment Details 2'),
    ('PAY-3', 'ORD-2', 25000.0, 'COMPLETED', 'Payment Details 3');
    
    
    
    
    select * from feedback
    
    select * from customer
    select * from payment
    
    
    
    
    
    
