CREATE DATABASE StoreX

-- ROLE TABLE
CREATE TABLE Roles (
    RoleID INT PRIMARY KEY IDENTITY(1,1),
    RoleName VARCHAR(50) NOT NULL
);

-- USERS TABLE
CREATE TABLE Users (
    UserID INT PRIMARY KEY IDENTITY(1,1),
    RoleID INT NOT NULL,
    Username VARCHAR(50) NOT NULL UNIQUE,
    PasswordHash VARCHAR(255) NOT NULL,
    FullName VARCHAR(100),
    FOREIGN KEY (RoleID) REFERENCES Roles(RoleID)
);

-- EMPLOYEES TABLE
CREATE TABLE Employees (
    EmployeeID INT PRIMARY KEY IDENTITY(1,1),
    EmployeeName VARCHAR(100) NOT NULL,
    Position VARCHAR(50) NOT NULL,
    AuthorityLevel INT NOT NULL,
    Department VARCHAR(50) NOT NULL
);

-- CATEGORIES TABLE
CREATE TABLE Categories (
    CategoryID INT PRIMARY KEY IDENTITY(1,1),
    CategoryName VARCHAR(50) NOT NULL UNIQUE
);

-- SUPPLIERS TABLE
CREATE TABLE Suppliers (
    SupplierID INT PRIMARY KEY IDENTITY(1,1),
    SupplierName VARCHAR(100) NOT NULL UNIQUE
);

CREATE TABLE Products (
    ProductID INT PRIMARY KEY IDENTITY(1,1),
    ProductName VARCHAR(100) NOT NULL,
    Quantity INT DEFAULT 0,
    CategoryID INT NOT NULL,
    SupplierID INT,
    FOREIGN KEY (CategoryID) REFERENCES Categories(CategoryID),
    FOREIGN KEY (SupplierID) REFERENCES Suppliers(SupplierID)
);

-- CUSTOMERS TABLE
CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY IDENTITY(1,1),
    CustomerName VARCHAR(100) NOT NULL,
    PhoneNumber VARCHAR(15),
    Address VARCHAR(255),
    Email VARCHAR(100)
);

-- ORDERS TABLE
CREATE TABLE Orders (
    OrderID INT PRIMARY KEY IDENTITY(1,1),
    OrderDate DATETIME NOT NULL DEFAULT GETDATE(),
    CustomerID INT NOT NULL,
    UserID INT NOT NULL,
    TotalAmount DECIMAL(10,2),
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID),
    FOREIGN KEY (UserID) REFERENCES Users(UserID)
);

-- ORDER DETAILS TABLE
CREATE TABLE OrderDetails (
    OrderDetailID INT PRIMARY KEY IDENTITY(1,1),
    OrderID INT NOT NULL,
    ProductID INT NOT NULL,
    Quantity INT NOT NULL,
    UnitPrice DECIMAL(10,2) NOT NULL,
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID),
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
);

-- INSERT INTO ROLES
INSERT INTO Roles (RoleName) VALUES ('Admin'), ('Sales'), ('Warehouse');

-- INSERT USERS
INSERT INTO Users (RoleID, Username, PasswordHash, FullName)
VALUES
    (1, 'admin', 'admin123', 'System Administrator'),
    (2, 'sales', 'sales123', 'John Salesman'),
    (3, 'warehouse', 'warehouse123', 'Jane Warehouse');

-- INSERT EMPLOYEES
INSERT INTO Employees (EmployeeName, Position, AuthorityLevel, Department)
VALUES
    ('Alice Manager', 'Manager', 5, 'Sales'),
    ('Bob Seller', 'Sales Representative', 3, 'Sales'),
    ('Charlie Logistic', 'Warehouse Supervisor', 4, 'Warehouse'),
    ('Diana Assistant', 'Assistant', 2, 'Administration'),
    ('Ethan IT', 'IT Support', 3, 'IT');

-- INSERT CATEGORIES
INSERT INTO Categories (CategoryName)
VALUES 
    ('Electronics'),
    ('Gadgets'),
    ('Hardware'),
    ('Audio');

-- INSERT SUPPLIERS
INSERT INTO Suppliers (SupplierName)
VALUES
    ('ABC Supplier'),
    ('XYZ Supplier'),
    ('Gadgets Inc.'),
    ('Tools Co.'),
    ('AudioWorld');

-- INSERT PRODUCTS USING CATEGORY AND SUPPLIER REFERENCES
INSERT INTO Products (ProductName, Quantity, CategoryID, SupplierID)
VALUES
    ('Widget A', 100, 1, 1),  -- Electronics, ABC Supplier
    ('Widget B', 50, 1, 2),   -- Electronics, XYZ Supplier
    ('Gadget X', 75, 2, 3),   -- Gadgets, Gadgets Inc.
    ('Tool Set', 30, 3, 4),   -- Hardware, Tools Co.
    ('Headphones', 20, 4, 5); -- Audio, AudioWorld

-- INSERT CUSTOMERS
INSERT INTO Customers (CustomerName, PhoneNumber, Address, Email)
VALUES
    ('Alice Johnson', '555-1234', '123 Main St', 'alice@example.com'),
    ('Bob Smith', '555-5678', '456 Oak Ave', 'bob@example.com'),
    ('Charlie Brown', '555-9876', '789 Pine Rd', 'charlie@sample.com'),
    ('Diana Prince', '555-6543', '101 Apple Way', 'diana@sample.com'),
    ('Ethan Hunt', '555-2468', '202 Orange Blvd', 'ethan@sample.com');

-- INSERT ORDERS
INSERT INTO Orders (CustomerID, UserID, TotalAmount)
VALUES
    (1, 2, 0.00),
    (2, 2, 0.00);

-- INSERT ORDER DETAILS
INSERT INTO OrderDetails (OrderID, ProductID, Quantity, UnitPrice)
VALUES
    (1, 1, 2, 19.99),
    (1, 3, 1, 49.99),
    (2, 2, 1, 29.99),
    (2, 4, 1, 59.99);

-- UPDATE TOTAL AMOUNT IN ORDERS
UPDATE Orders
SET TotalAmount = (
    SELECT SUM(Quantity * UnitPrice) 
    FROM OrderDetails 
    WHERE OrderDetails.OrderID = Orders.OrderID
);

-- SELECT TO VERIFY
SELECT * FROM Categories;
SELECT * FROM Suppliers;
SELECT * FROM Products;
SELECT * FROM Employees;
SELECT * FROM Customers;
SELECT * FROM Orders;
SELECT * FROM OrderDetails
SELECT * FROM Users;
SELECT * FROM Roles;

select * from Users where Username = 'admin' and PasswordHash = 'admin123'

SET IDENTITY_INSERT Products ON;

INSERT INTO Products (ProductID, ProductName, Quantity, CategoryID, SupplierID)
VALUES (101, 'Test Product', 50, 1, 2);


SET IDENTITY_INSERT Products OFF;
