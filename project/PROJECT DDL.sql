CREATE DATABASE project;

CREATE TABLE stores(
id integer PRIMARY KEY,
name varchar(255) NOT NULL,
address varchar(255),
schedule timestamp
);

CREATE TABLE brands(
id integer PRIMARY KEY,
name varchar(255)
);

CREATE TABLE vendors(
id integer PRIMARY KEY,
name varchar(255) NOT NULL,
brand_id integer references brands(id),
address varchar(255)
);

CREATE TABLE product_type(
id integer PRIMARY KEY,
name varchar(255),
package varchar(255)
);

--id(like upc code)
CREATE TABLE products(
id integer PRIMARY KEY,
price float CHECK ( price > 0 )NOT NULL,
name varchar(255),
store_id integer references stores(id),
sold integer,
prod_type_id integer,
brand_id integer references brands(id),
cur_year date
);

CREATE TABLE inventory(
store_id integer references stores(id),
prod_id integer references products(id),
availability boolean NOT NULL
);

CREATE TABLE customer(
id integer PRIMARY KEY,
full_name varchar(255),
store_id integer references stores(id),
delivery_address varchar(255)
);

CREATE TABLE shop_сart(
basket_id integer PRIMARY KEY,
total_sum float NOT NULL CHECK ( total_sum > 0) NOT NULL,
date timestamp,
cust_id integer references customer(id),
store_id integer references stores(id)
);