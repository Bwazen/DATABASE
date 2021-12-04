--1.

--a.
CREATE OR REPLACE FUNCTION inc(val integer) RETURNS integer AS $$
    BEGIN
        RETURN val + 1;
    END;$$

LANGUAGE PLPGSQL;

--b.
CREATE OR REPLACE FUNCTION sum(n integer, m integer) RETURNS integer AS $$
        BEGIN
            RETURN n+m;
        END;$$

LANGUAGE PLPGSQL;

--c.
CREATE OR replace FUNCTION div_by_2(val integer) RETURNS boolean AS $$
        BEGIN
            IF val % 2 == 0 THEN
               RETURN TRUE;
            ELSE
               RETURN FALSE;
            END IF;
        END;$$

LANGUAGE PLPGSQL;

--d.
CREATE OR REPLACE FUNCTION pass_check(passw text) RETURNS boolean AS $$
        BEGIN
            IF length(passw) >= 10 THEN
                RETURN TRUE;
            ELSE
                RETURN FALSE;
            END IF;
        END;$$

LANGUAGE PLPGSQL;

--e.
CREATE OR REPLACE FUNCTION two_out(a integer,out b integer,out c integer) as $$
    BEGIN
        b = a + 1;
        c = a - 1;
    END;$$

LANGUAGE PLPGSQL;

SELECT * FROM two_out(1);

--3.

--A procedure is a subroutine that performs
-- a specific action (CREATE PROCEDURE).

--A function is a subroutine that evaluates
-- a value (CREATE FUNCTION).


--4.

CREATE TABLE employee (
    id int PRIMARY KEY ,
    name varchar(255),
    date_of_birth date,
    age int,
    salary int,
    workexperince int,
    discount int
);

--a.
CREATE OR REPLACE PROCEDURE salary_a() AS $$
    BEGIN
        UPDATE employee
        SET salary = (workexperince / 2) * 0.1 * salary + salary,
            discount = (workexperince / 2) * 0.1 * employee.discount + employee.discount,
            discount = (workexperince /5 ) * 0.01 * employee.discount + employee.discount;
        COMMIT;
    END;$$

LANGUAGE PLPGSQL;


--b.
CREATE OR REPLACE PROCEDURE salary_b() AS $$
        BEGIN
            UPDATE employee
            SET salary = salary * 1.15
            WHERE age >= 40;
            UPDATE employee
            SET salary = salary * 1.15 * (workexperince / 8);
            UPDATE employee
            SET discount = 20 WHERE workexperince >= 8;
            COMMIT;
        END;$$

LANGUAGE PLPGSQL;