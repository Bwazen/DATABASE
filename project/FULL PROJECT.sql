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

--What are the 20 top-selling products at each store?
SELECT store_id, id, name, sold FROM products
WHERE store_id = 101
ORDER BY (sold) DESC LIMIT 20;

SELECT store_id, id, name, sold FROM products
WHERE store_id = 102
ORDER BY (sold) DESC LIMIT 20;

SELECT store_id, id, name, sold FROM products
WHERE store_id = 103
ORDER BY (sold) DESC LIMIT 20;

SELECT store_id, id, name, sold FROM products
WHERE store_id = 104
ORDER BY (sold) DESC LIMIT 20;

SELECT store_id, id, name, sold FROM products
WHERE store_id = 105
ORDER BY (sold) DESC LIMIT 20;

SELECT store_id, id, name, sold FROM products
WHERE store_id = 106
ORDER BY (sold) DESC LIMIT 20;

SELECT store_id, id, name, sold FROM products
WHERE store_id = 107
ORDER BY (sold) DESC LIMIT 20;

--What are the 5 stores with the most sales so far this year?
SELECT store_id, SUM( sold ) FROM products
WHERE EXTRACT(YEAR from cur_year) = 2020
GROUP BY store_id
ORDER BY SUM (sold) DESC LIMIT 5;


DROP TABLE stores;
DROP TABLE brands;
DROP TABLE vendors;
DROP TABLE product_type;
DROP TABLE products;
DROP TABLE inventory;
DROP TABLE customer;
DROP TABLE shop_сart;

INSERT INTO stores(id, name, address, schedule) VALUES (101, 'Store-1','Address-1', '2021-01-01 10:10:10');
INSERT INTO stores(id, name, address, schedule) VALUES (102, 'Store-2','Address-2', '2021-01-01 10:10:10');
INSERT INTO stores(id, name, address, schedule) VALUES (103, 'Store-3','Address-3', '2021-01-01 10:10:10');
INSERT INTO stores(id, name, address, schedule) VALUES (104, 'Store-4','Address-4', '2021-01-01 10:10:10');
INSERT INTO stores(id, name, address, schedule) VALUES (105, 'Store-5','Address-5', '2021-01-01 10:10:10');
INSERT INTO stores(id, name, address, schedule) VALUES (106, 'Store-6','Address-6', '2021-01-01 10:10:10');
INSERT INTO stores(id, name, address, schedule) VALUES (107, 'Store-7','Address-7', '2021-01-01 10:10:10');


INSERT INTO brands(id, name) VALUES (201, 'COKE');
INSERT INTO brands(id, name) VALUES (202, 'PEPSI');
INSERT INTO brands(id, name) VALUES (203, 'GARAGE');
INSERT INTO brands(id, name) VALUES (204, 'NESTLE');
INSERT INTO brands(id, name) VALUES (205, 'ДОМИК В ДЕРЕВНЕ');
INSERT INTO brands(id, name) VALUES (206, 'DANONE');
INSERT INTO brands(id, name) VALUES (207, 'BONDUELLE');
INSERT INTO brands(id, name) VALUES (208, 'АГУША');
INSERT INTO brands(id, name) VALUES (209, 'НАН-ХЛЕБ');
INSERT INTO brands(id, name) VALUES (210, 'GREENFIELD');

INSERT INTO vendors(id, name, brand_id, address) VALUES (301, 'Vendor-1', 201, 'Address-01');
INSERT INTO vendors(id, name, brand_id, address) VALUES (302, 'Vendor-2', 201, 'Address-02');
INSERT INTO vendors(id, name, brand_id, address) VALUES (303, 'Vendor-3', 202, 'Address-03');
INSERT INTO vendors(id, name, brand_id, address) VALUES (304, 'Vendor-4', 203, 'Address-04');
INSERT INTO vendors(id, name, brand_id, address) VALUES (305, 'Vendor-5', 204, 'Address-05');
INSERT INTO vendors(id, name, brand_id, address) VALUES (306, 'Vendor-6', 205, 'Address-06');
INSERT INTO vendors(id, name, brand_id, address) VALUES (307, 'Vendor-7', 206, 'Address-07');
INSERT INTO vendors(id, name, brand_id, address) VALUES (308, 'Vendor-8', 206, 'Address-08');
INSERT INTO vendors(id, name, brand_id, address) VALUES (309, 'Vendor-9', 207, 'Address-09');
INSERT INTO vendors(id, name, brand_id, address) VALUES (310, 'Vendor-10', 208, 'Address-10');
INSERT INTO vendors(id, name, brand_id, address) VALUES (311, 'Vendor-11', 209, 'Address-11');
INSERT INTO vendors(id, name, brand_id, address) VALUES (312, 'Vendor-12', 210, 'Address-12');

INSERT INTO product_type(id, name, package) VALUES (401, 'Сода', 'Банка');
INSERT INTO product_type(id, name, package) VALUES (402, 'Сода', 'Бутылка');
INSERT INTO product_type(id, name, package) VALUES (403, 'Пиво', 'Бутылка');
INSERT INTO product_type(id, name, package) VALUES (404, 'Батончики', 'Упаковка');
INSERT INTO product_type(id, name, package) VALUES (405, 'Молоко', 'Коробка');
INSERT INTO product_type(id, name, package) VALUES (406, 'Йогурт', 'Бутылка');
INSERT INTO product_type(id, name, package) VALUES (407, 'Замороженные Овощи', 'Банка');
INSERT INTO product_type(id, name, package) VALUES (408, 'Детское Питание', 'Упаковка');
INSERT INTO product_type(id, name, package) VALUES (409, 'Выпечка', 'Упаковка');
INSERT INTO product_type(id, name, package) VALUES (410, 'Чай', 'Коробка');

INSERT INTO products(id, price, name, store_id, sold, prod_type_id, brand_id, cur_year) VALUES (10101, 1.99, 'Кока-Кола', 101, 100, 401, 201, '2020-01-01');
INSERT INTO products(id, price, name, store_id, sold, prod_type_id, brand_id, cur_year) VALUES (10102, 1.99, 'Фанта', 101, 500, 401, 201, '2020-01-01');
INSERT INTO products(id, price, name, store_id, sold, prod_type_id, brand_id, cur_year) VALUES (10103, 1.99, 'Спрайт', 101, 200, 401, 201, '2020-01-01');
INSERT INTO products(id, price, name, store_id, sold, prod_type_id, brand_id, cur_year) VALUES (10104, 1.99, 'Миринда', 101, 400, 402, 202, '2020-01-01');
INSERT INTO products(id, price, name, store_id, sold, prod_type_id, brand_id, cur_year) VALUES (10105, 1.99, 'РедБулл', 101, 200, 402, 202, '2020-01-01');
INSERT INTO products(id, price, name, store_id, sold, prod_type_id, brand_id, cur_year) VALUES (10106, 1.99, 'Бёрн', 101, 700, 402, 202, '2020-01-01');
INSERT INTO products(id, price, name, store_id, sold, prod_type_id, brand_id, cur_year) VALUES (10107, 1.99, 'Жигулевское', 101, 500, 403, 203, '2020-01-01');
INSERT INTO products(id, price, name, store_id, sold, prod_type_id, brand_id, cur_year) VALUES (10108, 1.99, 'Гараж', 101, 500, 403, 203, '2020-01-01');
INSERT INTO products(id, price, name, store_id, sold, prod_type_id, brand_id, cur_year) VALUES (10109, 1.99, 'Балтика', 101, 600, 403, 203, '2020-01-01');
INSERT INTO products(id, price, name, store_id, sold, prod_type_id, brand_id, cur_year) VALUES (10110, 1.99, 'Сниккерс', 101, 900, 404, 204, '2020-01-01');
INSERT INTO products(id, price, name, store_id, sold, prod_type_id, brand_id, cur_year) VALUES (10111, 1.99, 'Киткат', 101, 100, 404, 204,'2020-01-01');
INSERT INTO products(id, price, name, store_id, sold, prod_type_id, brand_id, cur_year) VALUES (10112, 1.99, 'Пикник', 101, 200, 404, 204, '2020-01-01');
INSERT INTO products(id, price, name, store_id, sold, prod_type_id, brand_id, cur_year) VALUES (10113, 1.99, 'Обед', 101, 400, 404, 204, '2020-01-01');
INSERT INTO products(id, price, name, store_id, sold, prod_type_id, brand_id, cur_year) VALUES (10114, 1.99, 'Домик В Деревне', 101, 500, 405, 205, '2020-01-01');
INSERT INTO products(id, price, name, store_id, sold, prod_type_id, brand_id, cur_year) VALUES (10115, 1.99, 'Молоко N1', 101, 700, 405, 205, '2020-01-01');
INSERT INTO products(id, price, name, store_id, sold, prod_type_id, brand_id, cur_year) VALUES (10116, 1.99, 'Молоко N2', 101, 900, 405, 205, '2020-01-01');
INSERT INTO products(id, price, name, store_id, sold, prod_type_id, brand_id, cur_year) VALUES (10117, 1.99, 'Danone', 101, 200, 406, 206, '2020-01-01');
INSERT INTO products(id, price, name, store_id, sold, prod_type_id, brand_id, cur_year) VALUES (10118, 1.99, 'Йогурт N1', 101, 1000, 406, 206, '2020-01-01');
INSERT INTO products(id, price, name, store_id, sold, prod_type_id, brand_id, cur_year) VALUES (10119, 1.99, 'Йогурт N2', 101, 90, 406, 206, '2020-01-01');
INSERT INTO products(id, price, name, store_id, sold, prod_type_id, brand_id, cur_year) VALUES (10120, 1.99, 'Bonduelle', 101, 450, 407, 207, '2020-01-01');
INSERT INTO products(id, price, name, store_id, sold, prod_type_id, brand_id, cur_year) VALUES (10121, 1.99, 'Горошек', 101, 350, 407, 207, '2020-01-01');
INSERT INTO products(id, price, name, store_id, sold, prod_type_id, brand_id, cur_year) VALUES (10122, 1.99, 'Кукурузка', 101, 560, 407, 207, '2020-01-01');
INSERT INTO products(id, price, name, store_id, sold, prod_type_id, brand_id, cur_year) VALUES (10123, 1.99, 'Агуша', 101, 660, 408, 208, '2020-01-01');
INSERT INTO products(id, price, name, store_id, sold, prod_type_id, brand_id, cur_year) VALUES (10124, 1.99, 'Пюрешка', 101, 210, 408, 208, '2020-01-01');
INSERT INTO products(id, price, name, store_id, sold, prod_type_id, brand_id, cur_year) VALUES (10125, 1.99, 'Детский сок', 101, 790, 408, 208, '2020-01-01');
INSERT INTO products(id, price, name, store_id, sold, prod_type_id, brand_id, cur_year) VALUES (10126, 1.99, 'Хлеб', 101, 100, 409, 209, '2020-01-01');
INSERT INTO products(id, price, name, store_id, sold, prod_type_id, brand_id, cur_year) VALUES (10127, 1.99, 'Булка', 101, 410, 409, 209, '2020-01-01');
INSERT INTO products(id, price, name, store_id, sold, prod_type_id, brand_id, cur_year) VALUES (10128, 1.99, 'Крендель', 101, 120, 409, 209, '2020-01-01');
INSERT INTO products(id, price, name, store_id, sold, prod_type_id, brand_id, cur_year) VALUES (10129, 1.99, 'Greenfield', 101, 310, 410, 210, '2020-01-01');
INSERT INTO products(id, price, name, store_id, sold, prod_type_id, brand_id, cur_year) VALUES (10130, 1.99, 'Норм Чай', 101, 530, 410, 210, '2020-01-01');
INSERT INTO products(id, price, name, store_id, sold, prod_type_id, brand_id, cur_year) VALUES (10131, 1.99, 'Крутой Чай', 101, 710, 410, 210, '2020-01-01');

INSERT INTO products(id, price, name, store_id, sold, prod_type_id, brand_id, cur_year) VALUES (11101, 1.99, 'Кока-Кола', 102, 1000, 401, 201, '2020-01-01');
INSERT INTO products(id, price, name, store_id, sold, prod_type_id, brand_id, cur_year) VALUES (11102, 1.99, 'Фанта', 102, 1100, 401, 201, '2020-01-01');
INSERT INTO products(id, price, name, store_id, sold, prod_type_id, brand_id, cur_year) VALUES (11103, 1.99, 'Спрайт', 102, 1030, 401, 201, '2020-01-01');
INSERT INTO products(id, price, name, store_id, sold, prod_type_id, brand_id, cur_year) VALUES (11104, 1.99, 'Миринда', 102, 1400, 402, 202, '2020-01-01');
INSERT INTO products(id, price, name, store_id, sold, prod_type_id, brand_id, cur_year) VALUES (11105, 1.99, 'РедБулл', 102, 1200, 402, 202, '2020-01-01');
INSERT INTO products(id, price, name, store_id, sold, prod_type_id, brand_id, cur_year) VALUES (11106, 1.99, 'Бёрн', 102, 1500, 402, 202, '2020-01-01');
INSERT INTO products(id, price, name, store_id, sold, prod_type_id, brand_id, cur_year) VALUES (11107, 1.99, 'Жигулевское', 102, 1900, 403, 203, '2020-01-01');
INSERT INTO products(id, price, name, store_id, sold, prod_type_id, brand_id, cur_year) VALUES (11108, 1.99, 'Гараж', 102, 1760, 403, 203, '2020-01-01');
INSERT INTO products(id, price, name, store_id, sold, prod_type_id, brand_id, cur_year) VALUES (11109, 1.99, 'Балтика', 102, 1660, 403, 203, '2020-01-01');
INSERT INTO products(id, price, name, store_id, sold, prod_type_id, brand_id, cur_year) VALUES (11110, 1.99, 'Сниккерс', 102, 1330, 404, 204, '2020-01-01');
INSERT INTO products(id, price, name, store_id, sold, prod_type_id, brand_id, cur_year) VALUES (11111, 1.99, 'Киткат', 102, 1350, 404, 204, '2020-01-01');
INSERT INTO products(id, price, name, store_id, sold, prod_type_id, brand_id, cur_year) VALUES (11112, 1.99, 'Пикник', 102, 1900, 404, 204, '2020-01-01');
INSERT INTO products(id, price, name, store_id, sold, prod_type_id, brand_id, cur_year) VALUES (11113, 1.99, 'Обед', 102, 1130, 404, 204, '2020-01-01');
INSERT INTO products(id, price, name, store_id, sold, prod_type_id, brand_id, cur_year) VALUES (11114, 1.99, 'Домик В Деревне', 102, 1030, 405, 205, '2020-01-01');
INSERT INTO products(id, price, name, store_id, sold, prod_type_id, brand_id, cur_year) VALUES (11115, 1.99, 'Молоко N1', 102, 1960, 405, 205, '2020-01-01');
INSERT INTO products(id, price, name, store_id, sold, prod_type_id, brand_id, cur_year) VALUES (11116, 1.99, 'Молоко N2', 102, 1250, 405, 205, '2020-01-01');
INSERT INTO products(id, price, name, store_id, sold, prod_type_id, brand_id, cur_year) VALUES (11117, 1.99, 'Danone', 102, 1200, 406, 206, '2020-01-01');
INSERT INTO products(id, price, name, store_id, sold, prod_type_id, brand_id, cur_year) VALUES (11118, 1.99, 'Йогурт N1', 102, 900, 406, 206, '2020-01-01');
INSERT INTO products(id, price, name, store_id, sold, prod_type_id, brand_id, cur_year) VALUES (11119, 1.99, 'Йогурт N2', 102, 500, 406, 206, '2020-01-01');
INSERT INTO products(id, price, name, store_id, sold, prod_type_id, brand_id, cur_year) VALUES (11120, 1.99, 'Bonduelle', 102, 3500, 407, 207, '2020-01-01');
INSERT INTO products(id, price, name, store_id, sold, prod_type_id, brand_id, cur_year) VALUES (11121, 1.99, 'Горошек', 102, 1500, 407, 207, '2020-01-01');
INSERT INTO products(id, price, name, store_id, sold, prod_type_id, brand_id, cur_year) VALUES (11122, 1.99, 'Кукурузка', 102, 3100, 407, 207, '2020-01-01');
INSERT INTO products(id, price, name, store_id, sold, prod_type_id, brand_id, cur_year) VALUES (11123, 1.99, 'Агуша', 102, 1200, 408, 208, '2020-01-01');
INSERT INTO products(id, price, name, store_id, sold, prod_type_id, brand_id, cur_year) VALUES (11124, 1.99, 'Пюрешка', 102, 3100, 408, 208, '2020-01-01');
INSERT INTO products(id, price, name, store_id, sold, prod_type_id, brand_id, cur_year) VALUES (11125, 1.99, 'Детский сок', 102, 2500, 408, 208, '2020-01-01');
INSERT INTO products(id, price, name, store_id, sold, prod_type_id, brand_id, cur_year) VALUES (11126, 1.99, 'Хлеб', 102, 900, 409, 209, '2020-01-01');
INSERT INTO products(id, price, name, store_id, sold, prod_type_id, brand_id, cur_year) VALUES (11127, 1.99, 'Булка', 102, 600, 409, 209, '2020-01-01');
INSERT INTO products(id, price, name, store_id, sold, prod_type_id, brand_id, cur_year) VALUES (11128, 1.99, 'Крендель', 102, 3200, 409, 209, '2020-01-01');
INSERT INTO products(id, price, name, store_id, sold, prod_type_id, brand_id, cur_year) VALUES (11129, 1.99, 'Greenfield', 102, 3600, 410, 210, '2020-01-01');
INSERT INTO products(id, price, name, store_id, sold, prod_type_id, brand_id, cur_year) VALUES (11130, 1.99, 'Норм Чай', 102, 9000, 410, 210, '2020-01-01');
INSERT INTO products(id, price, name, store_id, sold, prod_type_id, brand_id, cur_year) VALUES (11131, 1.99, 'Крутой Чай', 102, 1300, 410, 210, '2020-01-01');

INSERT INTO products(id, price, name, store_id, sold, prod_type_id, brand_id, cur_year) VALUES (12101, 1.99, 'Кока-Кола', 103, 110, 401, 201, '2020-01-01');
INSERT INTO products(id, price, name, store_id, sold, prod_type_id, brand_id, cur_year) VALUES (12102, 1.99, 'Фанта', 103, 120, 401, 201, '2020-01-01');
INSERT INTO products(id, price, name, store_id, sold, prod_type_id, brand_id, cur_year) VALUES (12103, 1.99, 'Спрайт', 103, 130, 401, 201, '2020-01-01');
INSERT INTO products(id, price, name, store_id, sold, prod_type_id, brand_id, cur_year) VALUES (12104, 1.99, 'Миринда', 103, 140, 402, 202, '2020-01-01');
INSERT INTO products(id, price, name, store_id, sold, prod_type_id, brand_id, cur_year) VALUES (12105, 1.99, 'РедБулл', 103, 150, 402, 202, '2020-01-01');
INSERT INTO products(id, price, name, store_id, sold, prod_type_id, brand_id, cur_year) VALUES (12106, 1.99, 'Бёрн', 103, 160, 402, 202, '2020-01-01');
INSERT INTO products(id, price, name, store_id, sold, prod_type_id, brand_id, cur_year) VALUES (12107, 1.99, 'Жигулевское', 103, 170, 403, 203, '2020-01-01');
INSERT INTO products(id, price, name, store_id, sold, prod_type_id, brand_id, cur_year) VALUES (12108, 1.99, 'Гараж', 103, 180, 403, 203, '2020-01-01');
INSERT INTO products(id, price, name, store_id, sold, prod_type_id, brand_id, cur_year) VALUES (12109, 1.99, 'Балтика', 103, 190, 403, 203, '2020-01-01');
INSERT INTO products(id, price, name, store_id, sold, prod_type_id, brand_id, cur_year) VALUES (12110, 1.99, 'Сниккерс', 103, 200, 404, 204, '2020-01-01');
INSERT INTO products(id, price, name, store_id, sold, prod_type_id, brand_id, cur_year) VALUES (12111, 1.99, 'Киткат', 103, 210, 404, 204, '2020-01-01');
INSERT INTO products(id, price, name, store_id, sold, prod_type_id, brand_id, cur_year) VALUES (12112, 1.99, 'Пикник', 103, 220, 404, 204, '2020-01-01');
INSERT INTO products(id, price, name, store_id, sold, prod_type_id, brand_id, cur_year) VALUES (12113, 1.99, 'Обед', 103, 230, 404, 204, '2020-01-01');
INSERT INTO products(id, price, name, store_id, sold, prod_type_id, brand_id, cur_year) VALUES (12114, 1.99, 'Домик В Деревне', 103, 240, 405, 205, '2020-01-01');
INSERT INTO products(id, price, name, store_id, sold, prod_type_id, brand_id, cur_year) VALUES (12115, 1.99, 'Молоко N1', 103, 250, 405, 205, '2020-01-01');
INSERT INTO products(id, price, name, store_id, sold, prod_type_id, brand_id, cur_year) VALUES (12116, 1.99, 'Молоко N2', 103, 260, 405, 205, '2020-01-01');
INSERT INTO products(id, price, name, store_id, sold, prod_type_id, brand_id, cur_year) VALUES (12117, 1.99, 'Danone', 103, 270, 406, 206, '2020-01-01');
INSERT INTO products(id, price, name, store_id, sold, prod_type_id, brand_id, cur_year) VALUES (12118, 1.99, 'Йогурт N1', 103, 280, 406, 206, '2020-01-01');
INSERT INTO products(id, price, name, store_id, sold, prod_type_id, brand_id, cur_year) VALUES (12119, 1.99, 'Йогурт N2', 103, 290, 406, 206, '2020-01-01');
INSERT INTO products(id, price, name, store_id, sold, prod_type_id, brand_id, cur_year) VALUES (12120, 1.99, 'Bonduelle', 103, 300, 407, 207, '2020-01-01');
INSERT INTO products(id, price, name, store_id, sold, prod_type_id, brand_id, cur_year) VALUES (12121, 1.99, 'Горошек', 103, 310, 407, 207, '2020-01-01');
INSERT INTO products(id, price, name, store_id, sold, prod_type_id, brand_id, cur_year) VALUES (12122, 1.99, 'Кукурузка', 103, 320, 407, 207, '2020-01-01');
INSERT INTO products(id, price, name, store_id, sold, prod_type_id, brand_id, cur_year) VALUES (12123, 1.99, 'Агуша', 103, 100, 408, 208, '2020-01-01');
INSERT INTO products(id, price, name, store_id, sold, prod_type_id, brand_id, cur_year) VALUES (12124, 1.99, 'Пюрешка', 103, 100, 408, 208, '2020-01-01');
INSERT INTO products(id, price, name, store_id, sold, prod_type_id, brand_id, cur_year) VALUES (12125, 1.99, 'Детский сок', 103, 100, 408, 208, '2020-01-01');
INSERT INTO products(id, price, name, store_id, sold, prod_type_id, brand_id, cur_year) VALUES (12126, 1.99, 'Хлеб', 103, 100, 409, 209, '2020-01-01');
INSERT INTO products(id, price, name, store_id, sold, prod_type_id, brand_id, cur_year) VALUES (12127, 1.99, 'Булка', 103, 100, 409, 209, '2020-01-01');
INSERT INTO products(id, price, name, store_id, sold, prod_type_id, brand_id, cur_year) VALUES (12128, 1.99, 'Крендель', 103, 100, 409, 209, '2020-01-01');
INSERT INTO products(id, price, name, store_id, sold, prod_type_id, brand_id, cur_year) VALUES (12129, 1.99, 'Greenfield', 103, 100, 410, 210, '2020-01-01');
INSERT INTO products(id, price, name, store_id, sold, prod_type_id, brand_id, cur_year) VALUES (12130, 1.99, 'Норм Чай', 103, 100, 410, 210, '2020-01-01');
INSERT INTO products(id, price, name, store_id, sold, prod_type_id, brand_id, cur_year) VALUES (12131, 1.99, 'Крутой Чай', 103, 100, 410, 210, '2020-01-01');

INSERT INTO products(id, price, name, store_id, sold, prod_type_id, brand_id, cur_year) VALUES (13101, 1.99, 'Кока-Кола', 104, 934, 401, 201, '2020-01-01');
INSERT INTO products(id, price, name, store_id, sold, prod_type_id, brand_id, cur_year) VALUES (13102, 1.99, 'Фанта', 104, 914, 401, 201, '2020-01-01');
INSERT INTO products(id, price, name, store_id, sold, prod_type_id, brand_id, cur_year) VALUES (13103, 1.99, 'Спрайт', 104, 237, 401, 201, '2020-01-01');
INSERT INTO products(id, price, name, store_id, sold, prod_type_id, brand_id, cur_year) VALUES (13104, 1.99, 'Миринда', 104, 519, 402, 202, '2020-01-01');
INSERT INTO products(id, price, name, store_id, sold, prod_type_id, brand_id, cur_year) VALUES (13105, 1.99, 'РедБулл', 104, 458, 402, 202, '2020-01-01');
INSERT INTO products(id, price, name, store_id, sold, prod_type_id, brand_id, cur_year) VALUES (13106, 1.99, 'Бёрн', 104, 577, 402, 202, '2020-01-01');
INSERT INTO products(id, price, name, store_id, sold, prod_type_id, brand_id, cur_year) VALUES (13107, 1.99, 'Жигулевское', 104, 653, 403, 203, '2020-01-01');
INSERT INTO products(id, price, name, store_id, sold, prod_type_id, brand_id, cur_year) VALUES (13108, 1.99, 'Гараж', 104, 365, 403, 203, '2020-01-01');
INSERT INTO products(id, price, name, store_id, sold, prod_type_id, brand_id, cur_year) VALUES (13109, 1.99, 'Балтика', 104, 976, 403, 203, '2020-01-01');
INSERT INTO products(id, price, name, store_id, sold, prod_type_id, brand_id, cur_year) VALUES (13110, 1.99, 'Сниккерс', 104, 389, 404, 204, '2020-01-01');
INSERT INTO products(id, price, name, store_id, sold, prod_type_id, brand_id, cur_year) VALUES (13111, 1.99, 'Киткат', 104, 153, 404, 204, '2020-01-01');
INSERT INTO products(id, price, name, store_id, sold, prod_type_id, brand_id, cur_year) VALUES (13112, 1.99, 'Пикник', 104, 954, 404, 204, '2020-01-01');
INSERT INTO products(id, price, name, store_id, sold, prod_type_id, brand_id, cur_year) VALUES (13113, 1.99, 'Обед', 104, 594, 404, 204, '2020-01-01');
INSERT INTO products(id, price, name, store_id, sold, prod_type_id, brand_id, cur_year) VALUES (13114, 1.99, 'Домик В Деревне', 104, 754, 405, 205, '2020-01-01');
INSERT INTO products(id, price, name, store_id, sold, prod_type_id, brand_id, cur_year) VALUES (13115, 1.99, 'Молоко N1', 104, 930, 405, 205, '2020-01-01');
INSERT INTO products(id, price, name, store_id, sold, prod_type_id, brand_id, cur_year) VALUES (13116, 1.99, 'Молоко N2', 104, 842, 405, 205, '2020-01-01');
INSERT INTO products(id, price, name, store_id, sold, prod_type_id, brand_id, cur_year) VALUES (13117, 1.99, 'Danone', 104, 653, 406, 206, '2020-01-01');
INSERT INTO products(id, price, name, store_id, sold, prod_type_id, brand_id, cur_year) VALUES (13118, 1.99, 'Йогурт N1', 104, 671, 406, 206, '2020-01-01');
INSERT INTO products(id, price, name, store_id, sold, prod_type_id, brand_id, cur_year) VALUES (13119, 1.99, 'Йогурт N2', 104, 783, 406, 206, '2020-01-01');
INSERT INTO products(id, price, name, store_id, sold, prod_type_id, brand_id, cur_year) VALUES (13120, 1.99, 'Bonduelle', 104, 360, 407, 207, '2020-01-01');
INSERT INTO products(id, price, name, store_id, sold, prod_type_id, brand_id, cur_year) VALUES (13121, 1.99, 'Горошек', 104, 914, 407, 207, '2020-01-01');
INSERT INTO products(id, price, name, store_id, sold, prod_type_id, brand_id, cur_year) VALUES (13122, 1.99, 'Кукурузка', 104, 526, 407, 207, '2020-01-01');
INSERT INTO products(id, price, name, store_id, sold, prod_type_id, brand_id, cur_year) VALUES (13123, 1.99, 'Агуша', 104, 641, 408, 208, '2020-01-01');
INSERT INTO products(id, price, name, store_id, sold, prod_type_id, brand_id, cur_year) VALUES (13124, 1.99, 'Пюрешка', 104, 715, 408, 208, '2020-01-01');
INSERT INTO products(id, price, name, store_id, sold, prod_type_id, brand_id, cur_year) VALUES (13125, 1.99, 'Детский сок', 104, 913, 408, 208, '2020-01-01');
INSERT INTO products(id, price, name, store_id, sold, prod_type_id, brand_id, cur_year) VALUES (13126, 1.99, 'Хлеб', 104, 473, 409, 209, '2020-01-01');
INSERT INTO products(id, price, name, store_id, sold, prod_type_id, brand_id, cur_year) VALUES (13127, 1.99, 'Булка', 104, 428, 409, 209, '2020-01-01');
INSERT INTO products(id, price, name, store_id, sold, prod_type_id, brand_id, cur_year) VALUES (13128, 1.99, 'Крендель', 104, 117, 409, 209, '2020-01-01');
INSERT INTO products(id, price, name, store_id, sold, prod_type_id, brand_id, cur_year) VALUES (13129, 1.99, 'Greenfield', 104, 728, 410, 210, '2020-01-01');
INSERT INTO products(id, price, name, store_id, sold, prod_type_id, brand_id, cur_year) VALUES (13130, 1.99, 'Норм Чай', 104, 781, 410, 210, '2020-01-01');
INSERT INTO products(id, price, name, store_id, sold, prod_type_id, brand_id, cur_year) VALUES (13131, 1.99, 'Крутой Чай', 104, 657, 410, 210, '2020-01-01');

INSERT INTO products(id, price, name, store_id, sold, prod_type_id, brand_id, cur_year) VALUES (14101, 1.99, 'Кока-Кола', 105, 386, 401, 201, '2020-01-01');
INSERT INTO products(id, price, name, store_id, sold, prod_type_id, brand_id, cur_year) VALUES (14102, 1.99, 'Фанта', 105, 667, 401, 201, '2020-01-01');
INSERT INTO products(id, price, name, store_id, sold, prod_type_id, brand_id, cur_year) VALUES (14103, 1.99, 'Спрайт', 105, 966, 401, 201, '2020-01-01');
INSERT INTO products(id, price, name, store_id, sold, prod_type_id, brand_id, cur_year) VALUES (14104, 1.99, 'Миринда', 105, 412, 402, 202, '2020-01-01');
INSERT INTO products(id, price, name, store_id, sold, prod_type_id, brand_id, cur_year) VALUES (14105, 1.99, 'РедБулл', 105, 602, 402, 202, '2020-01-01');
INSERT INTO products(id, price, name, store_id, sold, prod_type_id, brand_id, cur_year) VALUES (14106, 1.99, 'Бёрн', 105, 939, 402, 202, '2020-01-01');
INSERT INTO products(id, price, name, store_id, sold, prod_type_id, brand_id, cur_year) VALUES (14107, 1.99, 'Жигулевское', 105, 254, 403, 203, '2020-01-01');
INSERT INTO products(id, price, name, store_id, sold, prod_type_id, brand_id, cur_year) VALUES (14108, 1.99, 'Гараж', 105, 824, 403, 203, '2020-01-01');
INSERT INTO products(id, price, name, store_id, sold, prod_type_id, brand_id, cur_year) VALUES (14109, 1.99, 'Балтика', 105, 223, 403, 203, '2020-01-01');
INSERT INTO products(id, price, name, store_id, sold, prod_type_id, brand_id, cur_year) VALUES (14110, 1.99, 'Сниккерс', 105, 955, 404, 204, '2020-01-01');
INSERT INTO products(id, price, name, store_id, sold, prod_type_id, brand_id, cur_year) VALUES (14111, 1.99, 'Киткат', 105, 802, 404, 204, '2020-01-01');
INSERT INTO products(id, price, name, store_id, sold, prod_type_id, brand_id, cur_year) VALUES (14112, 1.99, 'Пикник', 105, 802, 404, 204, '2020-01-01');
INSERT INTO products(id, price, name, store_id, sold, prod_type_id, brand_id, cur_year) VALUES (14113, 1.99, 'Обед', 105, 626, 404, 204, '2020-01-01');
INSERT INTO products(id, price, name, store_id, sold, prod_type_id, brand_id, cur_year) VALUES (14114, 1.99, 'Домик В Деревне', 105, 293, 405, 205, '2020-01-01');
INSERT INTO products(id, price, name, store_id, sold, prod_type_id, brand_id, cur_year) VALUES (14115, 1.99, 'Молоко N1', 105, 861, 405, 205, '2020-01-01');
INSERT INTO products(id, price, name, store_id, sold, prod_type_id, brand_id, cur_year) VALUES (14116, 1.99, 'Молоко N2', 105, 544, 405, 205, '2020-01-01');
INSERT INTO products(id, price, name, store_id, sold, prod_type_id, brand_id, cur_year) VALUES (14117, 1.99, 'Danone', 105, 997, 406, 206, '2020-01-01');
INSERT INTO products(id, price, name, store_id, sold, prod_type_id, brand_id, cur_year) VALUES (14118, 1.99, 'Йогурт N1', 105, 103, 406, 206, '2020-01-01');
INSERT INTO products(id, price, name, store_id, sold, prod_type_id, brand_id, cur_year) VALUES (14119, 1.99, 'Йогурт N2', 105, 322, 406, 206, '2020-01-01');
INSERT INTO products(id, price, name, store_id, sold, prod_type_id, brand_id, cur_year) VALUES (14120, 1.99, 'Bonduelle', 105, 912, 407, 207, '2020-01-01');
INSERT INTO products(id, price, name, store_id, sold, prod_type_id, brand_id, cur_year) VALUES (14121, 1.99, 'Горошек', 105, 685, 407, 207, '2020-01-01');
INSERT INTO products(id, price, name, store_id, sold, prod_type_id, brand_id, cur_year) VALUES (14122, 1.99, 'Кукурузка', 105, 273, 407, 207, '2020-01-01');
INSERT INTO products(id, price, name, store_id, sold, prod_type_id, brand_id, cur_year) VALUES (14123, 1.99, 'Агуша', 105, 536, 408, 208, '2020-01-01');
INSERT INTO products(id, price, name, store_id, sold, prod_type_id, brand_id, cur_year) VALUES (14124, 1.99, 'Пюрешка', 105, 386, 408, 208, '2020-01-01');
INSERT INTO products(id, price, name, store_id, sold, prod_type_id, brand_id, cur_year) VALUES (14125, 1.99, 'Детский сок', 105, 239, 408, 208, '2020-01-01');
INSERT INTO products(id, price, name, store_id, sold, prod_type_id, brand_id, cur_year) VALUES (14126, 1.99, 'Хлеб', 105, 415, 409, 209, '2020-01-01');
INSERT INTO products(id, price, name, store_id, sold, prod_type_id, brand_id, cur_year) VALUES (14127, 1.99, 'Булка', 105, 836, 409, 209, '2020-01-01');
INSERT INTO products(id, price, name, store_id, sold, prod_type_id, brand_id, cur_year) VALUES (14128, 1.99, 'Крендель', 105, 251, 409, 209, '2020-01-01');
INSERT INTO products(id, price, name, store_id, sold, prod_type_id, brand_id, cur_year) VALUES (14129, 1.99, 'Greenfield', 105, 289, 410, 210, '2020-01-01');
INSERT INTO products(id, price, name, store_id, sold, prod_type_id, brand_id, cur_year) VALUES (14130, 1.99, 'Норм Чай', 105, 985, 410, 210, '2020-01-01');
INSERT INTO products(id, price, name, store_id, sold, prod_type_id, brand_id, cur_year) VALUES (14131, 1.99, 'Крутой Чай', 105, 919, 410, 210, '2020-01-01');

INSERT INTO products(id, price, name, store_id, sold, prod_type_id, brand_id, cur_year) VALUES (15101, 1.99, 'Кока-Кола', 106, 950, 401, 201, '2020-01-01');
INSERT INTO products(id, price, name, store_id, sold, prod_type_id, brand_id, cur_year) VALUES (15102, 1.99, 'Фанта', 106, 844, 401, 201, '2020-01-01');
INSERT INTO products(id, price, name, store_id, sold, prod_type_id, brand_id, cur_year) VALUES (15103, 1.99, 'Спрайт', 106, 123, 401, 201, '2020-01-01');
INSERT INTO products(id, price, name, store_id, sold, prod_type_id, brand_id, cur_year) VALUES (15104, 1.99, 'Миринда', 106, 490, 402, 202, '2020-01-01');
INSERT INTO products(id, price, name, store_id, sold, prod_type_id, brand_id, cur_year) VALUES (15105, 1.99, 'РедБулл', 106, 398, 402, 202, '2020-01-01');
INSERT INTO products(id, price, name, store_id, sold, prod_type_id, brand_id, cur_year) VALUES (15106, 1.99, 'Бёрн', 106, 893, 402, 202, '2020-01-01');
INSERT INTO products(id, price, name, store_id, sold, prod_type_id, brand_id, cur_year) VALUES (15107, 1.99, 'Жигулевское', 106, 373, 403, 203, '2020-01-01');
INSERT INTO products(id, price, name, store_id, sold, prod_type_id, brand_id, cur_year) VALUES (15108, 1.99, 'Гараж', 106, 947, 403, 203, '2020-01-01');
INSERT INTO products(id, price, name, store_id, sold, prod_type_id, brand_id, cur_year) VALUES (15109, 1.99, 'Балтика', 106, 956, 403, 203, '2020-01-01');
INSERT INTO products(id, price, name, store_id, sold, prod_type_id, brand_id, cur_year) VALUES (15110, 1.99, 'Сниккерс', 106, 740, 404, 204, '2020-01-01');
INSERT INTO products(id, price, name, store_id, sold, prod_type_id, brand_id, cur_year) VALUES (15111, 1.99, 'Киткат', 106, 367, 404, 204, '2020-01-01');
INSERT INTO products(id, price, name, store_id, sold, prod_type_id, brand_id, cur_year) VALUES (15112, 1.99, 'Пикник', 106, 827, 404, 204, '2020-01-01');
INSERT INTO products(id, price, name, store_id, sold, prod_type_id, brand_id, cur_year) VALUES (15113, 1.99, 'Обед', 106, 533, 404, 204, '2020-01-01');
INSERT INTO products(id, price, name, store_id, sold, prod_type_id, brand_id, cur_year) VALUES (15114, 1.99, 'Домик В Деревне', 106, 484, 405, 205, '2020-01-01');
INSERT INTO products(id, price, name, store_id, sold, prod_type_id, brand_id, cur_year) VALUES (15115, 1.99, 'Молоко N1', 106, 439, 405, 205, '2020-01-01');
INSERT INTO products(id, price, name, store_id, sold, prod_type_id, brand_id, cur_year) VALUES (15116, 1.99, 'Молоко N2', 106, 203, 405, 205, '2020-01-01');
INSERT INTO products(id, price, name, store_id, sold, prod_type_id, brand_id, cur_year) VALUES (15117, 1.99, 'Danone', 106, 149, 406, 206, '2020-01-01');
INSERT INTO products(id, price, name, store_id, sold, prod_type_id, brand_id, cur_year) VALUES (15118, 1.99, 'Йогурт N1', 106, 592, 406, 206, '2020-01-01');
INSERT INTO products(id, price, name, store_id, sold, prod_type_id, brand_id, cur_year) VALUES (15119, 1.99, 'Йогурт N2', 106, 511, 406, 206, '2020-01-01');
INSERT INTO products(id, price, name, store_id, sold, prod_type_id, brand_id, cur_year) VALUES (15120, 1.99, 'Bonduelle', 106, 370, 407, 207, '2020-01-01');
INSERT INTO products(id, price, name, store_id, sold, prod_type_id, brand_id, cur_year) VALUES (15121, 1.99, 'Горошек', 106, 771, 407, 207, '2020-01-01');
INSERT INTO products(id, price, name, store_id, sold, prod_type_id, brand_id, cur_year) VALUES (15122, 1.99, 'Кукурузка', 106, 596, 407, 207, '2020-01-01');
INSERT INTO products(id, price, name, store_id, sold, prod_type_id, brand_id, cur_year) VALUES (15123, 1.99, 'Агуша', 106, 459, 408, 208, '2020-01-01');
INSERT INTO products(id, price, name, store_id, sold, prod_type_id, brand_id, cur_year) VALUES (15124, 1.99, 'Пюрешка', 106, 868, 408, 208, '2020-01-01');
INSERT INTO products(id, price, name, store_id, sold, prod_type_id, brand_id, cur_year) VALUES (15125, 1.99, 'Детский сок', 106, 469, 408, 208, '2020-01-01');
INSERT INTO products(id, price, name, store_id, sold, prod_type_id, brand_id, cur_year) VALUES (15126, 1.99, 'Хлеб', 106, 586, 409, 209, '2020-01-01');
INSERT INTO products(id, price, name, store_id, sold, prod_type_id, brand_id, cur_year) VALUES (15127, 1.99, 'Булка', 106, 206, 409, 209, '2020-01-01');
INSERT INTO products(id, price, name, store_id, sold, prod_type_id, brand_id, cur_year) VALUES (15128, 1.99, 'Крендель', 106, 745, 409, 209, '2020-01-01');
INSERT INTO products(id, price, name, store_id, sold, prod_type_id, brand_id, cur_year) VALUES (15129, 1.99, 'Greenfield', 106, 492, 410, 210, '2020-01-01');
INSERT INTO products(id, price, name, store_id, sold, prod_type_id, brand_id, cur_year) VALUES (15130, 1.99, 'Норм Чай', 106, 758, 410, 210, '2020-01-01');
INSERT INTO products(id, price, name, store_id, sold, prod_type_id, brand_id, cur_year) VALUES (15131, 1.99, 'Крутой Чай', 106, 315, 410, 210, '2020-01-01');

INSERT INTO products(id, price, name, store_id, sold, prod_type_id, brand_id, cur_year) VALUES (16101, 1.99, 'Кока-Кола', 107, 709, 401, 201, '2020-01-01');
INSERT INTO products(id, price, name, store_id, sold, prod_type_id, brand_id, cur_year) VALUES (16102, 1.99, 'Фанта', 107, 812, 401, 201, '2020-01-01');
INSERT INTO products(id, price, name, store_id, sold, prod_type_id, brand_id, cur_year) VALUES (16103, 1.99, 'Спрайт', 107, 641, 401, 201, '2020-01-01');
INSERT INTO products(id, price, name, store_id, sold, prod_type_id, brand_id, cur_year) VALUES (16104, 1.99, 'Миринда', 107, 281, 402, 202, '2020-01-01');
INSERT INTO products(id, price, name, store_id, sold, prod_type_id, brand_id, cur_year) VALUES (16105, 1.99, 'РедБулл', 107, 636, 402, 202, '2020-01-01');
INSERT INTO products(id, price, name, store_id, sold, prod_type_id, brand_id, cur_year) VALUES (16106, 1.99, 'Бёрн', 107, 101, 402, 202, '2020-01-01');
INSERT INTO products(id, price, name, store_id, sold, prod_type_id, brand_id, cur_year) VALUES (16107, 1.99, 'Жигулевское', 107, 207, 403, 203, '2020-01-01');
INSERT INTO products(id, price, name, store_id, sold, prod_type_id, brand_id, cur_year) VALUES (16108, 1.99, 'Гараж', 107, 981, 403, 203, '2020-01-01');
INSERT INTO products(id, price, name, store_id, sold, prod_type_id, brand_id, cur_year) VALUES (16109, 1.99, 'Балтика', 107, 780, 403, 203, '2020-01-01');
INSERT INTO products(id, price, name, store_id, sold, prod_type_id, brand_id, cur_year) VALUES (16110, 1.99, 'Сниккерс', 107, 455, 404, 204, '2020-01-01');
INSERT INTO products(id, price, name, store_id, sold, prod_type_id, brand_id, cur_year) VALUES (16111, 1.99, 'Киткат', 107, 251, 404, 204, '2020-01-01');
INSERT INTO products(id, price, name, store_id, sold, prod_type_id, brand_id, cur_year) VALUES (16112, 1.99, 'Пикник', 107, 879, 404, 204, '2020-01-01');
INSERT INTO products(id, price, name, store_id, sold, prod_type_id, brand_id, cur_year) VALUES (16113, 1.99, 'Обед', 107, 567, 404, 204, '2020-01-01');
INSERT INTO products(id, price, name, store_id, sold, prod_type_id, brand_id, cur_year) VALUES (16114, 1.99, 'Домик В Деревне', 107, 596, 405, 205, '2020-01-01');
INSERT INTO products(id, price, name, store_id, sold, prod_type_id, brand_id, cur_year) VALUES (16115, 1.99, 'Молоко N1', 107, 340, 405, 205, '2020-01-01');
INSERT INTO products(id, price, name, store_id, sold, prod_type_id, brand_id, cur_year) VALUES (16116, 1.99, 'Молоко N2', 107, 951, 405, 205, '2020-01-01');
INSERT INTO products(id, price, name, store_id, sold, prod_type_id, brand_id, cur_year) VALUES (16117, 1.99, 'Danone', 107, 541, 406, 206, '2020-01-01');
INSERT INTO products(id, price, name, store_id, sold, prod_type_id, brand_id, cur_year) VALUES (16118, 1.99, 'Йогурт N1', 107, 675, 406, 206, '2020-01-01');
INSERT INTO products(id, price, name, store_id, sold, prod_type_id, brand_id, cur_year) VALUES (16119, 1.99, 'Йогурт N2', 107, 733, 406, 206, '2020-01-01');
INSERT INTO products(id, price, name, store_id, sold, prod_type_id, brand_id, cur_year) VALUES (16120, 1.99, 'Bonduelle', 107, 862, 407, 207, '2020-01-01');
INSERT INTO products(id, price, name, store_id, sold, prod_type_id, brand_id, cur_year) VALUES (16121, 1.99, 'Горошек', 107, 103, 407, 207, '2020-01-01');
INSERT INTO products(id, price, name, store_id, sold, prod_type_id, brand_id, cur_year) VALUES (16122, 1.99, 'Кукурузка', 107, 554, 407, 207, '2020-01-01');
INSERT INTO products(id, price, name, store_id, sold, prod_type_id, brand_id, cur_year) VALUES (16123, 1.99, 'Агуша', 107, 792, 408, 208, '2020-01-01');
INSERT INTO products(id, price, name, store_id, sold, prod_type_id, brand_id, cur_year) VALUES (16124, 1.99, 'Пюрешка', 107, 561, 408, 208, '2020-01-01');
INSERT INTO products(id, price, name, store_id, sold, prod_type_id, brand_id, cur_year) VALUES (16125, 1.99, 'Детский сок', 107, 384, 408, 208, '2020-01-01');
INSERT INTO products(id, price, name, store_id, sold, prod_type_id, brand_id, cur_year) VALUES (16126, 1.99, 'Хлеб', 107, 620, 409, 209, '2020-01-01');
INSERT INTO products(id, price, name, store_id, sold, prod_type_id, brand_id, cur_year) VALUES (16127, 1.99, 'Булка', 107, 825, 409, 209, '2020-01-01');
INSERT INTO products(id, price, name, store_id, sold, prod_type_id, brand_id, cur_year) VALUES (16128, 1.99, 'Крендель', 107, 824, 409, 209, '2020-01-01');
INSERT INTO products(id, price, name, store_id, sold, prod_type_id, brand_id, cur_year) VALUES (16129, 1.99, 'Greenfield', 107, 579, 410, 210, '2020-01-01');
INSERT INTO products(id, price, name, store_id, sold, prod_type_id, brand_id, cur_year) VALUES (16130, 1.99, 'Норм Чай', 107, 463, 410, 210, '2020-01-01');
INSERT INTO products(id, price, name, store_id, sold, prod_type_id, brand_id, cur_year) VALUES (16131, 1.99, 'Крутой Чай', 107, 580, 410, 210, '2020-01-01');

INSERT INTO inventory(store_id, prod_id, availability) VALUES (101, 10101, TRUE);
INSERT INTO inventory(store_id, prod_id, availability) VALUES (101, 10102, TRUE);
INSERT INTO inventory(store_id, prod_id, availability) VALUES (101, 10103, TRUE);
INSERT INTO inventory(store_id, prod_id, availability) VALUES (101, 10104, TRUE);
INSERT INTO inventory(store_id, prod_id, availability) VALUES (101, 10105, TRUE);
INSERT INTO inventory(store_id, prod_id, availability) VALUES (101, 10106, TRUE);
INSERT INTO inventory(store_id, prod_id, availability) VALUES (101, 10107, TRUE);
INSERT INTO inventory(store_id, prod_id, availability) VALUES (101, 10108, TRUE);
INSERT INTO inventory(store_id, prod_id, availability) VALUES (101, 10109, TRUE);
INSERT INTO inventory(store_id, prod_id, availability) VALUES (101, 10110, TRUE);
INSERT INTO inventory(store_id, prod_id, availability) VALUES (101, 10111, TRUE);
INSERT INTO inventory(store_id, prod_id, availability) VALUES (101, 10112, TRUE);
INSERT INTO inventory(store_id, prod_id, availability) VALUES (101, 10113, TRUE);
INSERT INTO inventory(store_id, prod_id, availability) VALUES (101, 10114, TRUE);
INSERT INTO inventory(store_id, prod_id, availability) VALUES (101, 10115, TRUE);
INSERT INTO inventory(store_id, prod_id, availability) VALUES (101, 10116, TRUE);
INSERT INTO inventory(store_id, prod_id, availability) VALUES (101, 10117, TRUE);
INSERT INTO inventory(store_id, prod_id, availability) VALUES (101, 10118, TRUE);
INSERT INTO inventory(store_id, prod_id, availability) VALUES (101, 10119, TRUE);
INSERT INTO inventory(store_id, prod_id, availability) VALUES (101, 10120, TRUE);
INSERT INTO inventory(store_id, prod_id, availability) VALUES (101, 10121, TRUE);
INSERT INTO inventory(store_id, prod_id, availability) VALUES (101, 10122, TRUE);
INSERT INTO inventory(store_id, prod_id, availability) VALUES (101, 10123, TRUE);
INSERT INTO inventory(store_id, prod_id, availability) VALUES (101, 10124, TRUE);
INSERT INTO inventory(store_id, prod_id, availability) VALUES (101, 10125, TRUE);
INSERT INTO inventory(store_id, prod_id, availability) VALUES (101, 10126, TRUE);
INSERT INTO inventory(store_id, prod_id, availability) VALUES (101, 10127, TRUE);
INSERT INTO inventory(store_id, prod_id, availability) VALUES (101, 10128, TRUE);
INSERT INTO inventory(store_id, prod_id, availability) VALUES (101, 10129, TRUE);
INSERT INTO inventory(store_id, prod_id, availability) VALUES (101, 10130, TRUE);
INSERT INTO inventory(store_id, prod_id, availability) VALUES (101, 10131, TRUE);

INSERT INTO inventory(store_id, prod_id, availability) VALUES (102, 11101, TRUE);
INSERT INTO inventory(store_id, prod_id, availability) VALUES (102, 11102, TRUE);
INSERT INTO inventory(store_id, prod_id, availability) VALUES (102, 11103, TRUE);
INSERT INTO inventory(store_id, prod_id, availability) VALUES (102, 11104, TRUE);
INSERT INTO inventory(store_id, prod_id, availability) VALUES (102, 11105, TRUE);
INSERT INTO inventory(store_id, prod_id, availability) VALUES (102, 11106, TRUE);
INSERT INTO inventory(store_id, prod_id, availability) VALUES (102, 11107, TRUE);
INSERT INTO inventory(store_id, prod_id, availability) VALUES (102, 11108, TRUE);
INSERT INTO inventory(store_id, prod_id, availability) VALUES (102, 11109, TRUE);
INSERT INTO inventory(store_id, prod_id, availability) VALUES (102, 11110, TRUE);
INSERT INTO inventory(store_id, prod_id, availability) VALUES (102, 11111, TRUE);
INSERT INTO inventory(store_id, prod_id, availability) VALUES (102, 11112, TRUE);
INSERT INTO inventory(store_id, prod_id, availability) VALUES (102, 11113, TRUE);
INSERT INTO inventory(store_id, prod_id, availability) VALUES (102, 11114, TRUE);
INSERT INTO inventory(store_id, prod_id, availability) VALUES (102, 11115, TRUE);
INSERT INTO inventory(store_id, prod_id, availability) VALUES (102, 11116, TRUE);
INSERT INTO inventory(store_id, prod_id, availability) VALUES (102, 11117, TRUE);
INSERT INTO inventory(store_id, prod_id, availability) VALUES (102, 11118, TRUE);
INSERT INTO inventory(store_id, prod_id, availability) VALUES (102, 11119, TRUE);
INSERT INTO inventory(store_id, prod_id, availability) VALUES (102, 11120, TRUE);
INSERT INTO inventory(store_id, prod_id, availability) VALUES (102, 11121, TRUE);
INSERT INTO inventory(store_id, prod_id, availability) VALUES (102, 11122, TRUE);
INSERT INTO inventory(store_id, prod_id, availability) VALUES (102, 11123, TRUE);
INSERT INTO inventory(store_id, prod_id, availability) VALUES (102, 11124, TRUE);
INSERT INTO inventory(store_id, prod_id, availability) VALUES (102, 11125, TRUE);
INSERT INTO inventory(store_id, prod_id, availability) VALUES (102, 11126, TRUE);
INSERT INTO inventory(store_id, prod_id, availability) VALUES (102, 11127, TRUE);
INSERT INTO inventory(store_id, prod_id, availability) VALUES (102, 11128, TRUE);
INSERT INTO inventory(store_id, prod_id, availability) VALUES (102, 11129, TRUE);
INSERT INTO inventory(store_id, prod_id, availability) VALUES (102, 11130, TRUE);
INSERT INTO inventory(store_id, prod_id, availability) VALUES (102, 11131, TRUE);

INSERT INTO inventory(store_id, prod_id, availability) VALUES (103, 12101, TRUE);
INSERT INTO inventory(store_id, prod_id, availability) VALUES (103, 12102, TRUE);
INSERT INTO inventory(store_id, prod_id, availability) VALUES (103, 12103, TRUE);
INSERT INTO inventory(store_id, prod_id, availability) VALUES (103, 12104, TRUE);
INSERT INTO inventory(store_id, prod_id, availability) VALUES (103, 12105, TRUE);
INSERT INTO inventory(store_id, prod_id, availability) VALUES (103, 12106, TRUE);
INSERT INTO inventory(store_id, prod_id, availability) VALUES (103, 12107, TRUE);
INSERT INTO inventory(store_id, prod_id, availability) VALUES (103, 12108, TRUE);
INSERT INTO inventory(store_id, prod_id, availability) VALUES (103, 12109, TRUE);
INSERT INTO inventory(store_id, prod_id, availability) VALUES (103, 12110, TRUE);
INSERT INTO inventory(store_id, prod_id, availability) VALUES (103, 12111, TRUE);
INSERT INTO inventory(store_id, prod_id, availability) VALUES (103, 12112, TRUE);
INSERT INTO inventory(store_id, prod_id, availability) VALUES (103, 12113, TRUE);
INSERT INTO inventory(store_id, prod_id, availability) VALUES (103, 12114, TRUE);
INSERT INTO inventory(store_id, prod_id, availability) VALUES (103, 12115, TRUE);
INSERT INTO inventory(store_id, prod_id, availability) VALUES (103, 12116, TRUE);
INSERT INTO inventory(store_id, prod_id, availability) VALUES (103, 12117, TRUE);
INSERT INTO inventory(store_id, prod_id, availability) VALUES (103, 12118, TRUE);
INSERT INTO inventory(store_id, prod_id, availability) VALUES (103, 12119, TRUE);
INSERT INTO inventory(store_id, prod_id, availability) VALUES (103, 12120, TRUE);
INSERT INTO inventory(store_id, prod_id, availability) VALUES (103, 12121, TRUE);
INSERT INTO inventory(store_id, prod_id, availability) VALUES (103, 12122, TRUE);
INSERT INTO inventory(store_id, prod_id, availability) VALUES (103, 12123, TRUE);
INSERT INTO inventory(store_id, prod_id, availability) VALUES (103, 12124, TRUE);
INSERT INTO inventory(store_id, prod_id, availability) VALUES (103, 12125, TRUE);
INSERT INTO inventory(store_id, prod_id, availability) VALUES (103, 12126, TRUE);
INSERT INTO inventory(store_id, prod_id, availability) VALUES (103, 12127, TRUE);
INSERT INTO inventory(store_id, prod_id, availability) VALUES (103, 12128, TRUE);
INSERT INTO inventory(store_id, prod_id, availability) VALUES (103, 12129, TRUE);
INSERT INTO inventory(store_id, prod_id, availability) VALUES (103, 12130, TRUE);
INSERT INTO inventory(store_id, prod_id, availability) VALUES (103, 12131, TRUE);

INSERT INTO inventory(store_id, prod_id, availability) VALUES (104, 13101, TRUE);
INSERT INTO inventory(store_id, prod_id, availability) VALUES (104, 13102, TRUE);
INSERT INTO inventory(store_id, prod_id, availability) VALUES (104, 13103, TRUE);
INSERT INTO inventory(store_id, prod_id, availability) VALUES (104, 13104, TRUE);
INSERT INTO inventory(store_id, prod_id, availability) VALUES (104, 13105, TRUE);
INSERT INTO inventory(store_id, prod_id, availability) VALUES (104, 13106, TRUE);
INSERT INTO inventory(store_id, prod_id, availability) VALUES (104, 13107, TRUE);
INSERT INTO inventory(store_id, prod_id, availability) VALUES (104, 13108, TRUE);
INSERT INTO inventory(store_id, prod_id, availability) VALUES (104, 13109, TRUE);
INSERT INTO inventory(store_id, prod_id, availability) VALUES (104, 13110, TRUE);
INSERT INTO inventory(store_id, prod_id, availability) VALUES (104, 13111, TRUE);
INSERT INTO inventory(store_id, prod_id, availability) VALUES (104, 13112, TRUE);
INSERT INTO inventory(store_id, prod_id, availability) VALUES (104, 13113, TRUE);
INSERT INTO inventory(store_id, prod_id, availability) VALUES (104, 13114, TRUE);
INSERT INTO inventory(store_id, prod_id, availability) VALUES (104, 13115, TRUE);
INSERT INTO inventory(store_id, prod_id, availability) VALUES (104, 13116, TRUE);
INSERT INTO inventory(store_id, prod_id, availability) VALUES (104, 13117, TRUE);
INSERT INTO inventory(store_id, prod_id, availability) VALUES (104, 13118, TRUE);
INSERT INTO inventory(store_id, prod_id, availability) VALUES (104, 13119, TRUE);
INSERT INTO inventory(store_id, prod_id, availability) VALUES (104, 13120, TRUE);
INSERT INTO inventory(store_id, prod_id, availability) VALUES (104, 13121, TRUE);
INSERT INTO inventory(store_id, prod_id, availability) VALUES (104, 13122, TRUE);
INSERT INTO inventory(store_id, prod_id, availability) VALUES (104, 13123, TRUE);
INSERT INTO inventory(store_id, prod_id, availability) VALUES (104, 13124, TRUE);
INSERT INTO inventory(store_id, prod_id, availability) VALUES (104, 13125, TRUE);
INSERT INTO inventory(store_id, prod_id, availability) VALUES (104, 13126, TRUE);
INSERT INTO inventory(store_id, prod_id, availability) VALUES (104, 13127, TRUE);
INSERT INTO inventory(store_id, prod_id, availability) VALUES (104, 13128, TRUE);
INSERT INTO inventory(store_id, prod_id, availability) VALUES (104, 13129, TRUE);
INSERT INTO inventory(store_id, prod_id, availability) VALUES (104, 13130, TRUE);
INSERT INTO inventory(store_id, prod_id, availability) VALUES (104, 13131, TRUE);

INSERT INTO inventory(store_id, prod_id, availability) VALUES (105, 14101, TRUE);
INSERT INTO inventory(store_id, prod_id, availability) VALUES (105, 14102, TRUE);
INSERT INTO inventory(store_id, prod_id, availability) VALUES (105, 14103, TRUE);
INSERT INTO inventory(store_id, prod_id, availability) VALUES (105, 14104, TRUE);
INSERT INTO inventory(store_id, prod_id, availability) VALUES (105, 14105, TRUE);
INSERT INTO inventory(store_id, prod_id, availability) VALUES (105, 14106, TRUE);
INSERT INTO inventory(store_id, prod_id, availability) VALUES (105, 14107, TRUE);
INSERT INTO inventory(store_id, prod_id, availability) VALUES (105, 14108, TRUE);
INSERT INTO inventory(store_id, prod_id, availability) VALUES (105, 14109, TRUE);
INSERT INTO inventory(store_id, prod_id, availability) VALUES (105, 14110, TRUE);
INSERT INTO inventory(store_id, prod_id, availability) VALUES (105, 14111, TRUE);
INSERT INTO inventory(store_id, prod_id, availability) VALUES (105, 14112, TRUE);
INSERT INTO inventory(store_id, prod_id, availability) VALUES (105, 14113, TRUE);
INSERT INTO inventory(store_id, prod_id, availability) VALUES (105, 14114, TRUE);
INSERT INTO inventory(store_id, prod_id, availability) VALUES (105, 14115, TRUE);
INSERT INTO inventory(store_id, prod_id, availability) VALUES (105, 14116, TRUE);
INSERT INTO inventory(store_id, prod_id, availability) VALUES (105, 14117, TRUE);
INSERT INTO inventory(store_id, prod_id, availability) VALUES (105, 14118, TRUE);
INSERT INTO inventory(store_id, prod_id, availability) VALUES (105, 14119, TRUE);
INSERT INTO inventory(store_id, prod_id, availability) VALUES (105, 14120, TRUE);
INSERT INTO inventory(store_id, prod_id, availability) VALUES (105, 14121, TRUE);
INSERT INTO inventory(store_id, prod_id, availability) VALUES (105, 14122, TRUE);
INSERT INTO inventory(store_id, prod_id, availability) VALUES (105, 14123, TRUE);
INSERT INTO inventory(store_id, prod_id, availability) VALUES (105, 14124, TRUE);
INSERT INTO inventory(store_id, prod_id, availability) VALUES (105, 14125, TRUE);
INSERT INTO inventory(store_id, prod_id, availability) VALUES (105, 14126, TRUE);
INSERT INTO inventory(store_id, prod_id, availability) VALUES (105, 14127, TRUE);
INSERT INTO inventory(store_id, prod_id, availability) VALUES (105, 14128, TRUE);
INSERT INTO inventory(store_id, prod_id, availability) VALUES (105, 14129, TRUE);
INSERT INTO inventory(store_id, prod_id, availability) VALUES (105, 14130, TRUE);
INSERT INTO inventory(store_id, prod_id, availability) VALUES (105, 14131, TRUE);


INSERT INTO inventory(store_id, prod_id, availability) VALUES (106, 15101, TRUE);
INSERT INTO inventory(store_id, prod_id, availability) VALUES (106, 15102, TRUE);
INSERT INTO inventory(store_id, prod_id, availability) VALUES (106, 15103, TRUE);
INSERT INTO inventory(store_id, prod_id, availability) VALUES (106, 15104, TRUE);
INSERT INTO inventory(store_id, prod_id, availability) VALUES (106, 15105, TRUE);
INSERT INTO inventory(store_id, prod_id, availability) VALUES (106, 15106, TRUE);
INSERT INTO inventory(store_id, prod_id, availability) VALUES (106, 15107, TRUE);
INSERT INTO inventory(store_id, prod_id, availability) VALUES (106, 15108, TRUE);
INSERT INTO inventory(store_id, prod_id, availability) VALUES (106, 15109, TRUE);
INSERT INTO inventory(store_id, prod_id, availability) VALUES (106, 15110, TRUE);
INSERT INTO inventory(store_id, prod_id, availability) VALUES (106, 15111, TRUE);
INSERT INTO inventory(store_id, prod_id, availability) VALUES (106, 15112, TRUE);
INSERT INTO inventory(store_id, prod_id, availability) VALUES (106, 15113, TRUE);
INSERT INTO inventory(store_id, prod_id, availability) VALUES (106, 15114, TRUE);
INSERT INTO inventory(store_id, prod_id, availability) VALUES (106, 15115, TRUE);
INSERT INTO inventory(store_id, prod_id, availability) VALUES (106, 15116, TRUE);
INSERT INTO inventory(store_id, prod_id, availability) VALUES (106, 15117, TRUE);
INSERT INTO inventory(store_id, prod_id, availability) VALUES (106, 15118, TRUE);
INSERT INTO inventory(store_id, prod_id, availability) VALUES (106, 15119, TRUE);
INSERT INTO inventory(store_id, prod_id, availability) VALUES (106, 15120, TRUE);
INSERT INTO inventory(store_id, prod_id, availability) VALUES (106, 15121, TRUE);
INSERT INTO inventory(store_id, prod_id, availability) VALUES (106, 15122, TRUE);
INSERT INTO inventory(store_id, prod_id, availability) VALUES (106, 15123, TRUE);
INSERT INTO inventory(store_id, prod_id, availability) VALUES (106, 15124, TRUE);
INSERT INTO inventory(store_id, prod_id, availability) VALUES (106, 15125, TRUE);
INSERT INTO inventory(store_id, prod_id, availability) VALUES (106, 15126, TRUE);
INSERT INTO inventory(store_id, prod_id, availability) VALUES (106, 15127, TRUE);
INSERT INTO inventory(store_id, prod_id, availability) VALUES (106, 15128, TRUE);
INSERT INTO inventory(store_id, prod_id, availability) VALUES (106, 15129, TRUE);
INSERT INTO inventory(store_id, prod_id, availability) VALUES (106, 15130, TRUE);
INSERT INTO inventory(store_id, prod_id, availability) VALUES (106, 15131, TRUE);

INSERT INTO inventory(store_id, prod_id, availability) VALUES (107, 16101, TRUE);
INSERT INTO inventory(store_id, prod_id, availability) VALUES (107, 16102, TRUE);
INSERT INTO inventory(store_id, prod_id, availability) VALUES (107, 16103, TRUE);
INSERT INTO inventory(store_id, prod_id, availability) VALUES (107, 16104, TRUE);
INSERT INTO inventory(store_id, prod_id, availability) VALUES (107, 16105, TRUE);
INSERT INTO inventory(store_id, prod_id, availability) VALUES (107, 16106, TRUE);
INSERT INTO inventory(store_id, prod_id, availability) VALUES (107, 16107, TRUE);
INSERT INTO inventory(store_id, prod_id, availability) VALUES (107, 16108, TRUE);
INSERT INTO inventory(store_id, prod_id, availability) VALUES (107, 16109, TRUE);
INSERT INTO inventory(store_id, prod_id, availability) VALUES (107, 16110, TRUE);
INSERT INTO inventory(store_id, prod_id, availability) VALUES (107, 16111, TRUE);
INSERT INTO inventory(store_id, prod_id, availability) VALUES (107, 16112, TRUE);
INSERT INTO inventory(store_id, prod_id, availability) VALUES (107, 16113, TRUE);
INSERT INTO inventory(store_id, prod_id, availability) VALUES (107, 16114, TRUE);
INSERT INTO inventory(store_id, prod_id, availability) VALUES (107, 16115, TRUE);
INSERT INTO inventory(store_id, prod_id, availability) VALUES (107, 16116, TRUE);
INSERT INTO inventory(store_id, prod_id, availability) VALUES (107, 16117, TRUE);
INSERT INTO inventory(store_id, prod_id, availability) VALUES (107, 16118, TRUE);
INSERT INTO inventory(store_id, prod_id, availability) VALUES (107, 16119, TRUE);
INSERT INTO inventory(store_id, prod_id, availability) VALUES (107, 16120, TRUE);
INSERT INTO inventory(store_id, prod_id, availability) VALUES (107, 16121, TRUE);
INSERT INTO inventory(store_id, prod_id, availability) VALUES (107, 16122, TRUE);
INSERT INTO inventory(store_id, prod_id, availability) VALUES (107, 16123, TRUE);
INSERT INTO inventory(store_id, prod_id, availability) VALUES (107, 16124, TRUE);
INSERT INTO inventory(store_id, prod_id, availability) VALUES (107, 16125, TRUE);
INSERT INTO inventory(store_id, prod_id, availability) VALUES (107, 16126, TRUE);
INSERT INTO inventory(store_id, prod_id, availability) VALUES (107, 16127, TRUE);
INSERT INTO inventory(store_id, prod_id, availability) VALUES (107, 16128, TRUE);
INSERT INTO inventory(store_id, prod_id, availability) VALUES (107, 16129, TRUE);
INSERT INTO inventory(store_id, prod_id, availability) VALUES (107, 16130, TRUE);
INSERT INTO inventory(store_id, prod_id, availability) VALUES (107, 16131, TRUE);

INSERT INTO customer(id, full_name, store_id, delivery_address) VALUES (10001, 'Lamperouge, Lelouch', 101, 'Address - 1');
INSERT INTO customer(id, full_name, store_id, delivery_address) VALUES (10002, 'Levi', 101, 'Address - 2');
INSERT INTO customer(id, full_name, store_id, delivery_address) VALUES (10003, 'Lawliet, L', 101, 'Address - 3');
INSERT INTO customer(id, full_name, store_id, delivery_address) VALUES (10004, 'Okabe, Rintarou', 101, 'Address - 4');
INSERT INTO customer(id, full_name, store_id, delivery_address) VALUES (10005, 'Yagami, Light', 101, 'Address - 5');
INSERT INTO customer(id, full_name, store_id, delivery_address) VALUES (10006, 'Zoldyck, Killua', 101, 'Address - 6');

INSERT INTO customer(id, full_name, store_id, delivery_address) VALUES (10021, 'Elric, Edward', 102, 'Address - 11');
INSERT INTO customer(id, full_name, store_id, delivery_address) VALUES (10022, 'Chika Fujiwara', 102, 'Address - 22');
INSERT INTO customer(id, full_name, store_id, delivery_address) VALUES (10023, 'Izuku Midoriya', 102, 'Address - 33');
INSERT INTO customer(id, full_name, store_id, delivery_address) VALUES (10024, 'Kurosaki Ichigo', 102, 'Address - 44');
INSERT INTO customer(id, full_name, store_id, delivery_address) VALUES (10025, 'Sasuke Uchiha', 102, 'Address - 55');
INSERT INTO customer(id, full_name, store_id, delivery_address) VALUES (10026, 'Shoto Todoroki', 102, 'Address - 66');

INSERT INTO customer(id, full_name, store_id, delivery_address) VALUES (10031, 'Reigen Arataka', 103, 'Address - 111');
INSERT INTO customer(id, full_name, store_id, delivery_address) VALUES (10032, 'Violet Evergarden', 103, 'Address - 222');
INSERT INTO customer(id, full_name, store_id, delivery_address) VALUES (10033, 'Bakugo Katsuki', 103, 'Address - 333');
INSERT INTO customer(id, full_name, store_id, delivery_address) VALUES (10034, 'Tobio Kageyama', 103, 'Address - 444');
INSERT INTO customer(id, full_name, store_id, delivery_address) VALUES (10035, 'Koyomi Araragi', 103, 'Address - 555');
INSERT INTO customer(id, full_name, store_id, delivery_address) VALUES (10036, 'Dazai Osamu', 103, 'Address - 666');

INSERT INTO customer(id, full_name, store_id, delivery_address) VALUES (10041, 'Shigeo Kageyama', 104, 'Address - 1111');
INSERT INTO customer(id, full_name, store_id, delivery_address) VALUES (10042, 'Onizuka Eikichi', 104, 'Address - 2222');
INSERT INTO customer(id, full_name, store_id, delivery_address) VALUES (10043, 'Kurapika', 104, 'Address - 3333');
INSERT INTO customer(id, full_name, store_id, delivery_address) VALUES (10044, 'Saber', 104, 'Address - 4444');
INSERT INTO customer(id, full_name, store_id, delivery_address) VALUES (10045, 'Aisaka Taiga', 104, 'Address - 5555');
INSERT INTO customer(id, full_name, store_id, delivery_address) VALUES (10046, 'Kaguya Shinomiya', 104, 'Address - 6666');

INSERT INTO customer(id, full_name, store_id, delivery_address) VALUES (10051, 'Shinobu Oshino', 105, 'Address - 11111');
INSERT INTO customer(id, full_name, store_id, delivery_address) VALUES (10052, 'Hikigaya Hachiman', 105, 'Address - 22222');
INSERT INTO customer(id, full_name, store_id, delivery_address) VALUES (10053, 'Zero Two', 105, 'Address - 33333');
INSERT INTO customer(id, full_name, store_id, delivery_address) VALUES (10054, 'Hisoka', 105, 'Address - 44444');
INSERT INTO customer(id, full_name, store_id, delivery_address) VALUES (10055, 'Roy Mustang', 105, 'Address - 55555');
INSERT INTO customer(id, full_name, store_id, delivery_address) VALUES (10056, 'Joseph Joestar', 105, 'Address - 66666');

INSERT INTO customer(id, full_name, store_id, delivery_address) VALUES (10061, 'Gojo Satoru', 106, 'Address - 111111');
INSERT INTO customer(id, full_name, store_id, delivery_address) VALUES (10062, 'Megumin', 106, 'Address - 222222');
INSERT INTO customer(id, full_name, store_id, delivery_address) VALUES (10063, 'Yato', 106, 'Address - 333333');
INSERT INTO customer(id, full_name, store_id, delivery_address) VALUES (10064, 'Senjougahara Hitagi', 106, 'Address - 444444');
INSERT INTO customer(id, full_name, store_id, delivery_address) VALUES (10065, 'Emilia', 106, 'Address - 555555');
INSERT INTO customer(id, full_name, store_id, delivery_address) VALUES (10066, 'Spike Spiegel', 106, 'Address - 666666');

INSERT INTO customer(id, full_name, store_id, delivery_address) VALUES (10071, 'Kakashi Hatake', 107, 'Address - 1111111');
INSERT INTO customer(id, full_name, store_id, delivery_address) VALUES (10072, 'Saitama', 107, 'Address - 2222222');
INSERT INTO customer(id, full_name, store_id, delivery_address) VALUES (10073, 'Rem', 107, 'Address - 3333333');
INSERT INTO customer(id, full_name, store_id, delivery_address) VALUES (10074, 'Ram', 107, 'Address - 4444444');
INSERT INTO customer(id, full_name, store_id, delivery_address) VALUES (10075, 'Kaneki Ken', 107, 'Address - 5555555');
INSERT INTO customer(id, full_name, store_id, delivery_address) VALUES (10076, 'Itachi Uchiha', 107, 'Address - 6666666');

INSERT INTO shop_сart(basket_id, total_sum, date, cust_id, store_id) VALUES (1010, 300, '2020-01-01', 10001, 101);
INSERT INTO shop_сart(basket_id, total_sum, date, cust_id, store_id) VALUES (1011, 500, '2020-01-01', 10021, 102);
INSERT INTO shop_сart(basket_id, total_sum, date, cust_id, store_id) VALUES (1012, 600, '2020-01-01', 10031, 103);
INSERT INTO shop_сart(basket_id, total_sum, date, cust_id, store_id) VALUES (1013, 200, '2020-01-01', 10041, 104);
INSERT INTO shop_сart(basket_id, total_sum, date, cust_id, store_id) VALUES (1014, 402, '2020-01-01', 10051, 105);
INSERT INTO shop_сart(basket_id, total_sum, date, cust_id, store_id) VALUES (1015, 1014, '2020-01-01', 10061, 106);
INSERT INTO shop_сart(basket_id, total_sum, date, cust_id, store_id) VALUES (1016, 60, '2020-01-01', 10061, 107);


