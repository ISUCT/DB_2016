CREATE TABLE Client
(
ID_Client Int primary key,
Name varchar,
Phone_number Int,
Address varchar
);

CREATE TABLE Book
(
ID_Book Int primary key,
Name varchar,
Author varchar,
Section_of_literature varchar,
Price Int
);

CREATE TABLE Author
(
ID_Author Int primary key,
Name varchar
);

CREATE TABLE Cart
(
ID_Order Int primary key,
ID_Book Int,
Quantity Int
);

CREATE TABLE Purchase
(
ID_Order Int primary key,
ID_Client Int,
Order_Date TimeStamp,
Delivery_Date TimeStamp,
Shipping_Cost Int,
Delivery_Type varchar
);