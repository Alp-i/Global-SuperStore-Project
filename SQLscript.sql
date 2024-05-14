CREATE TABLE GlobalSuperStore (
    Row_ID INT PRIMARY KEY,
    Order_ID VARCHAR(50),
    Order_Date DATE,
    Ship_Date DATE,
    Ship_Mode VARCHAR(50),
    Customer_ID VARCHAR(50),
    Customer_Name VARCHAR(100),
    Segment VARCHAR(50),
    City VARCHAR(100),
    State VARCHAR(50),
    Country VARCHAR(50),
    Market VARCHAR(50),
    Region VARCHAR(50),
    Product_ID VARCHAR(50),
    Category VARCHAR(50),
    Sub_Category VARCHAR(50),
    Product_Name VARCHAR(100),
    Revenue DECIMAL(15,2),
    Quantity INT,
    Discount DECIMAL(5,2),
    Profit DECIMAL(15,2),
    Shipping_Cost DECIMAL(15,2),
    Order_Priority VARCHAR(50)
);
CREATE TABLE TerritoryTable (
    City VARCHAR(16) PRIMARY KEY,
    State VARCHAR(32),
    Country VARCHAR(32),
    Market VARCHAR(2),
    Region VARCHAR(16)
);
CREATE TABLE CustomerLookup (
   Customer_ID VARCHAR(50) PRIMARY KEY,
    Customer_Name VARCHAR(100),
    Segment VARCHAR(50)


);
CREATE TABLE ProductTable (
    Product_ID VARCHAR(50) PRIMARY KEY,
    Category VARCHAR(50),
    Sub_Category VARCHAR(50),
    Product_Name VARCHAR(100)

);
CREATE TABLE OrderTable (
    Order_ID VARCHAR(50) PRIMARY KEY,
    Order_Date DATE,
    Ship_Date DATE,
    Ship_Mode VARCHAR(50),
	Revenue DECIMAL(15,2),
    Quantity INT,
    Discount DECIMAL(5,2),
    Profit DECIMAL(15,2),
    Shipping_Cost DECIMAL(15,2),
    Order_Priority VARCHAR(50),
	City VARCHAR(16),
	Product_ID VARCHAR(50),
	Customer_ID VARCHAR(50)
	
	

);
ALTER TABLE OrderTable
ADD CONSTRAINT fk_order_product
FOREIGN KEY (Product_ID)
REFERENCES ProductTable(Product_ID);

ALTER TABLE OrderTable
ADD CONSTRAINT fk_order_city
FOREIGN KEY (City)
REFERENCES TerritoryTable(City);

ALTER TABLE OrderTable
ADD CONSTRAINT fk_order_customer
FOREIGN KEY (Customer_ID)
REFERENCES CustomerLookup(Customer_ID);


CREATE TABLE CalendarLookup (
    Order_Date DATE PRIMARY KEY
    
);


ALTER TABLE CalendarLookup
ADD COLUMN start_of_month DATE;
UPDATE CalendarLookup
SET start_of_month = DATE_TRUNC('month', Order_Date);


ALTER TABLE OrderTable
ADD CONSTRAINT fk_order_calendar
FOREIGN KEY (Order_Date)
REFERENCES CalendarLookup(Order_Date);


DROP TABLE globalsuperstore;












