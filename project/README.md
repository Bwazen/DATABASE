# DATABASE 2021 PROJECT WORK

Project submission: 04/12/2021

Prepared by: Alexander Park

ID: 20B030309

## Description

This is my prototype of Enterprise
- For ER diagramm i used Adobe Photoshop 
![alt text](https://github.com/pojiloikbtugit/DATABASE/blob/main/project/PROJECT%20ER%20DIAGRAMM%20.png)
- Project done in DataGrip
- Used Python for getting random numbers
```
import random
print(random.sample(range(100,1000),30))
```
- Stores sells ONLY food
- This is Diagram in DataGrip

![alt text](https://github.com/pojiloikbtugit/DATABASE/blob/main/project/DataGripDiagram.PNG)


## Tasks

Following tasks
- E-R Model (Done)

- Relational Model (Done) 
Didn't make indexes because inserted and changed values a lot

- Populate Relations (Done)

- Queries:

What are the 20 top-selling products at each store? (DONE)

What are the 20 top-selling products in each state? (Not DONE)

What are the 5 stores with the most sales so far this year? (DONE)

In how many stores does Coke outsell Pepsi? (Or, a similar query for enterprises that don’t
sell soda.) (Not DONE)

What are the top 3 types of product that customers buy in addition to milk? (Or similar 
question for nonfood enterprises.) (Not DONE)

## Project Code

As I understand it, the chain of stores is my enterprise, so I did not create a separate table for it.

Here i have my store table, which stores information  
```
CREATE TABLE stores(
id integer PRIMARY KEY,
name varchar(255) NOT NULL,
address varchar(255),
schedule timestamp
);
```

Next table brands, where we store a lot of different brands, such as Pepsi, Coke and so on.

```
CREATE TABLE brands(
id integer PRIMARY KEY,
name varchar(255)
);

```

Table vendors, vendors salling brands to stores.

```
CREATE TABLE vendors(
id integer PRIMARY KEY,
name varchar(255) NOT NULL,
brand_id integer references brands(id),
address varchar(255),
store_id integer references stores(id)
);
```

Table product_type is needed in order to determine what type of products we have

```
CREATE TABLE product_type(
id integer PRIMARY KEY,
name varchar(255),
package varchar(255)
);
```

Table product, here we store all information about products, including price, amount of sold products and when it was sold.

```
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
```

Table inventory ыerves to know if a product is in stock 

```
CREATE TABLE inventory(
store_id integer references stores(id),
prod_id integer references products(id),
availability boolean NOT NULL
);

```
The table of consumers, where the information about the сustomers is stored. Shop_cart serves as a "check" for the customer.

```
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
```


