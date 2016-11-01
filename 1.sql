CREATE TABLE Client
(
ID_Client Int primary key,
Name varchar,
Age Int,
Address varchar
);

CREATE TABLE Item
(
ID_Item Int primary key,
Name varchar,
Price Int
);

CREATE TABLE Purchase
(
ID_Order Int primary key,
ID_Client Int,
ID_Item Int
);

