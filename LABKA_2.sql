--1.
-- Data definition language -
-- with the help of operators included in this group,
-- we define the structure of the database and work with the objects of this database, i.e. create, modify and delete them.
-- Commands: CREATE, ALTER, DROP...

-- Example:
CREATE DATABASE aboba (
     with owner bwazen,
     template template0,
     encoding UTF-8
);


CREATE TABLE bebra (
    name varchar(20),
    surname varchar(20),
    age integer
);

DROP TABLE aboba;

--Data Manipulation Language (DML) -
-- is a group of operators for data manipulation.
-- With the help of these operators, we can add, modify, delete and unload data from the database, i.e. manipulate them.
-- Commands: SELECT, INSERT, UPDATE, DELETE...

-- Example:
INSERT INTO bebra(name, surname, age) VALUES ( 'Sussy', 'Bakka', 18 );
SELECT * FROM bebra;
DELETE FROM bebra WHERE name = 'Sussy';
UPDATE bebra SET name = 'Nuhach', surname = 'Bebry' WHERE age = 18;

--2.
CREATE DATABASE labka;

CREATE TABLE customers (
    id integer PRIMARY KEY,
    full_name varchar(50) NOT NULL,
    timestamp timestamp NOT NULL,
    delivery_address text NOT NULL
);

CREATE TABLE orders (
    code integer PRIMARY KEY,
    customer_id int REFERENCES customers(id),
    total_sum double precision CHECK ( total_sum > 0 ) NOT NULL ,
    is_paid boolean NOT NULL
);

CREATE TABLE products (
    id varchar PRIMARY KEY,
    name varchar UNIQUE NOT NULL ,
    description text,
    price double precision CHECK ( price > 0) NOT NULL
);

CREATE TABLE order_items (
    order_code integer REFERENCES orders(code) NOT NULL,
    product_id varchar REFERENCES  products(id) NOT NULL ,
    quantity integer CHECK ( quantity > 0 ) NOT NULL
);

--3.
CREATE DATABASE university;

CREATE TABLE students (
    full_name varchar(50) NOT NULL ,
    age integer NOT NULL ,
    birth_date date,
    gender varchar(20),
    average_grade float NOT NULL ,
    info text,
    dormitory boolean,
    add_info text
);

CREATE TABLE instructors (
    full_name varchar(50) NOT NULL,
    languages text,
    work_exp text,
    remote_less boolean
);

CREATE TABLE lesson_participants (
    title varchar(50) NOT NULL,
    instructor varchar(50) REFERENCES instructors(full_name),
    student varchar(50) REFERENCES students(full_name),
    room_num integer CHECK ( room_num > 0 )
);

--4.
INSERT INTO customers(id, full_name, timestamp, delivery_address)
VALUES (1, 'BOBIK', '1.11.1111 11:11', '2222, Almaty');

INSERT INTO orders(code, customer_id, total_sum, is_paid)
VALUES (10, 1, 7777.7, false);

UPDATE orders SET is_paid = true WHERE customer_id = 1;

DELETE from customers WHERE full_name = 'BOBIK'
--ERROR: update or delete on table "customers" violates foreign key constraint "orders_customer_id_fkey" on table "orders"