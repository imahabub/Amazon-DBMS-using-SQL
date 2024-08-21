CREATE DATABASE AmazonDB;
USE AmazonDB;

-- Creating the Customer table
CREATE TABLE Customer (
    CustomerID INT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Email VARCHAR(100),
    Phone VARCHAR(20),
    Address VARCHAR(255),
    RegistrationDate DATE,
    LoyaltyPoints INT
);

-- Creating the Product table
CREATE TABLE Product (
    ProductID INT PRIMARY KEY,
    ProductName VARCHAR(100),
    Description TEXT,
    Price DECIMAL(10, 2),
    StockQuantity INT,
    Weight DECIMAL(5, 2),
    Dimensions VARCHAR(50)
);

-- Creating the Order table
CREATE TABLE "Order" (
    OrderID INT PRIMARY KEY,
    CustomerID INT,
    OrderDate DATE,
    ShippingAddress VARCHAR(255),
    PaymentMethod VARCHAR(50),
    OrderStatus VARCHAR(50),
    TotalAmount DECIMAL(10, 2),
    TaxAmount DECIMAL(10, 2),
    ShippingFee DECIMAL(10, 2),
    FOREIGN KEY (CustomerID) REFERENCES Customer(CustomerID)
);

-- Creating the OrderItem table
CREATE TABLE OrderItem (
    OrderItemID INT PRIMARY KEY,
    OrderID INT,
    ProductID INT,
    Quantity INT,
    Subtotal DECIMAL(10, 2),
    FOREIGN KEY (OrderID) REFERENCES "Order"(OrderID),
    FOREIGN KEY (ProductID) REFERENCES Product(ProductID)
);

-- Creating the Vendor table
CREATE TABLE Vendor (
    VendorID INT PRIMARY KEY,
    VendorName VARCHAR(100),
    ContactName VARCHAR(50),
    ContactEmail VARCHAR(100),
    Phone VARCHAR(20),
    Address VARCHAR(255)
);

-- Creating the Review table
CREATE TABLE Review (
    ReviewID INT PRIMARY KEY,
    ProductID INT,
    CustomerID INT,
    Rating INT,
    ReviewText TEXT,
    ReviewDate DATE,
    FOREIGN KEY (ProductID) REFERENCES Product(ProductID),
    FOREIGN KEY (CustomerID) REFERENCES Customer(CustomerID)
);

-- Inserting data into the Customer table
INSERT INTO Customer (CustomerID, FirstName, LastName, Email, Phone, Address, RegistrationDate, LoyaltyPoints) VALUES
(1, 'Alex', 'Hales', 'alex@hotmail.com', '6294565688', '123 Etrret', '2023-01-15', 120),
(2, 'Steve', 'Smith', 'steve.smith@gmail.com', '8614588968', '4545 aerSt', '2023-02-10', 250),
(3, 'Michael', 'Johnson', 'michael@hotmail.com', '2569885901', '709 Pipr St', '2023-03-05', 300),
(4, 'Jessica', 'Brown', 'jessica.br@gmail.com', '3420054012', '152 Maout St', '2023-04-20', 180),
(5, 'Taylor', 'Ross', 'ross@hotmail.com', '4568541528', '202 Bjute St', '2023-05-15', 75),
(6, 'Emily', 'Sophia', 'sophia.emily@yahoo.com', '5679854264', '306 Kedar St', '2023-06-01', 220),
(7, 'Katie', 'Evertson', 'katie@hotmail.com', '6825995645', '409 Spuweh St', '2023-06-20', 135),
(8, 'Eva', 'Martinez', 'eva.martinez@gmail.com', '7885447893', '508 Willow St', '2023-07-10', 400),
(9, 'Eva', 'Anderson', 'eva.anderson@hotmail.com', '8901258997', '6078FragSt', '2023-07-25', 190),
(10, 'James', 'Anderson', 'jsc.anderson@hotmail.com', '9012859598', '704 Palm Sr', '2023-08-05', 310);

-- Inserting data into the Product table
INSERT INTO Product (ProductID, ProductName, Description, Price, StockQuantity, Weight, Dimensions) VALUES
(1, 'Laptop', 'High performance laptop', 1200.00, 50, 2.5, '15x10x1 inches'),
(2, 'Smartphone', 'Latest model smartphone', 800.00, 100, 0.4, '6x3x0.3 inches'),
(3, 'Tablet', '10-inch display tablet', 500.00, 70, 1.2, '10x7x0.5 inches'),
(4, 'Headphones', 'Noise-cancelling headphones', 200.00, 200, 0.3, '8x7x3 inches'),
(5, 'Smartwatch', 'Water-resistant smartwatch', 300.00, 150, 0.2, '1.5x1.5x0.5 inches'),
(6, 'Monitor', '27-inch 4K monitor', 400.00, 80, 8.0, '27x18x5 inches'),
(7, 'Keyboard', 'Mechanical keyboard', 100.00, 120, 1.0, '18x6x2 inches'),
(8, 'Mouse', 'Wireless mouse', 50.00, 300, 0.1, '4x2x1 inches'),
(9, 'Printer', 'All-in-one printer', 250.00, 60, 10.0, '20x18x10 inches'),
(10, 'External Hard Drive', '1TB external hard drive', 100.00, 200, 0.5, '5x3x1 inches');

-- Inserting data into the Order table
INSERT INTO "Order" (OrderID, CustomerID, OrderDate, ShippingAddress, PaymentMethod, OrderStatus, TotalAmount, TaxAmount, ShippingFee) VALUES
(1, 1, '2024-08-01', '123 Elm St', 'Credit Card', 'Shipped', 1350.00, 100.00, 20.00),
(2, 2, '2024-08-02', '456 Oak St', 'PayPal', 'Processing', 900.00, 80.00, 15.00),
(3, 3, '2024-08-03', '789 Pine St', 'Credit Card', 'Delivered', 520.00, 50.00, 10.00),
(4, 4, '2024-08-04', '101 Maple St', 'Debit Card', 'Delivered', 220.00, 20.00, 5.00),
(5, 5, '2024-08-05', '202 Birch St', 'Credit Card', 'Cancelled', 320.00, 30.00, 10.00),
(6, 6, '2024-08-06', '303 Cedar St', 'PayPal', 'Processing', 420.00, 40.00, 15.00),
(7, 7, '2024-08-07', '404 Spruce St', 'Credit Card', 'Shipped', 150.00, 10.00, 5.00),
(8, 8, '2024-08-08', '505 Willow St', 'Debit Card', 'Delivered', 480.00, 50.00, 10.00),
(9, 9, '2024-08-09', '606 Fir St', 'PayPal', 'Processing', 1100.00, 100.00, 20.00),
(10, 10, '2024-08-10', '707 Palm St', 'Credit Card', 'Delivered', 1450.00, 150.00, 25.00);

-- Inserting data into the OrderItem table
INSERT INTO OrderItem (OrderItemID, OrderID, ProductID, Quantity, Subtotal) VALUES
(1, 1, 1, 1, 1200.00),
(2, 1, 4, 1, 150.00),
(3, 2, 2, 1, 800.00),
(4, 2, 7, 1, 100.00),
(5, 3, 3, 1, 500.00),
(6, 3, 8, 1, 20.00),
(7, 4, 5, 1, 200.00),
(8, 4, 8, 1, 20.00),
(9, 5, 6, 1, 400.00),
(10, 6, 6, 1, 400.00);

-- Inserting data into the Vendor table
INSERT INTO Vendor (VendorID, VendorName, ContactName, ContactEmail, Phone, Address) VALUES
(1, 'TechSupplier Ltd', 'Alice Cooper', 'alice.cooper@techsupplier.com', '1234567890', '789 Pine St'),
(2, 'Gadget World', 'Bob Marley', 'bob.marley@gadgetworld.com', '0987654321', '101 Maple St'),
(3, 'Electronic Hub', 'Charlie Brown', 'charlie.brown@electronicshub.com', '2345678901', '202 Birch St'),
(4, 'Device Depot', 'David Gilmour', 'david.gilmour@devicedepot.com', '3456789012', '303 Cedar St'),
(5, 'Digital Solutions', 'Eddie Van', 'eddie.van@digitalsolutions.com', '4567890123', '404 Spruce St'),
(6, 'Techno Mart', 'Freddie Mercury', 'freddie.mercury@technomart.com', '5678901234', '505 Willow St'),
(7, 'Future Electronics', 'George Harrison', 'george.harrison@futureelectronics.com', '6789012345', '606 Fir St'),
(8, 'Gizmo Galore', 'Harry Styles', 'harry.styles@gizmogalore.com', '7890123456', '707 Palm St'),
(9, 'Innovative Electronics', 'Ian Anderson', 'ian.anderson@innovativeelectronics.com', '8901234567', '808 Maple St'),
(10, 'Smart Tech', 'Jimi Hendrix', 'jimi.hendrix@smarttech.com', '9012345678', '909 Cedar St');

-- Inserting data into the Review table
INSERT INTO Review (ReviewID, ProductID, CustomerID, Rating, ReviewText, ReviewDate) VALUES
(1, 1, 1, 5, 'Excellent laptop, very fast!', '2024-08-01'),
(2, 2, 2, 4, 'Good phone, but a bit overpriced.', '2024-08-02'),
(3, 3, 3, 5, 'Great tablet for the price.', '2024-08-03'),
(4, 4, 4, 3, 'Headphones are decent, but not the best.', '2024-08-04'),
(5, 5, 5, 4, 'Smartwatch is good, but battery life could be better.', '2024-08-05'),
(6, 6, 6, 5, 'Amazing monitor, very clear display!', '2024-08-06'),
(7, 7, 7, 4, 'Keyboard is very responsive.', '2024-08-07'),
(8, 8, 8, 5, 'Mouse works perfectly, very comfortable.', '2024-08-08'),
(9, 9, 9, 4, 'Printer is good, but a bit noisy.', '2024-08-09'),
(10, 10, 10, 5, 'External hard drive is fast and reliable.', '2024-08-10');


-- View data from Customer table
SELECT * FROM Customer;

-- View data from Product table
SELECT * FROM Product;

-- View data from Order table
SELECT * FROM "Order";

-- View data from OrderItem table
SELECT * FROM OrderItem;

-- View data from Vendor table
SELECT * FROM Vendor;

-- View data from Review table
SELECT * FROM Review;
