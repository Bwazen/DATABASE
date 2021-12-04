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