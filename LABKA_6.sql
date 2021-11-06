--1.

--a.
SELECT *
FROM dealer
    CROSS JOIN client;
--b.
SELECT d.name, c.name, c.city, c.priority, s.id as sell_number, s.date, s.amount
FROM dealer d
    INNER JOIN client c on d.id = c.dealer_id
    INNER JOIN sell s on c.id = s.client_id;
--c.
SELECT d.name, c.name, city
fROM dealer d
    INNER JOIN client c on d.location = c.city;
--d.
SELECT sell.id, amount, name, city
FROM sell
    INNER JOIN client c on amount >= 100 AND amount <= 500 and sell.client_id = c.id;
--e.
SELECT d.id, d.name
FROM client
    RIGHT JOIN dealer d on d.id = client.dealer_id;
--f.
SELECT c.name, city, d.name, charge
FROM client c
    INNER JOIN dealer d on d.id = c.dealer_id;
--g.
SELECT c.name, city, d.name, charge
FROM client c
    INNER JOIN dealer d on d.id = c.dealer_id AND charge > 0.12;
--h.
SELECT c.name, city, s.id, s.date, amount, d.name, charge
FROM client c
    LEFT JOIN dealer d on d.id = c.dealer_id
    LEFT JOIN sell s on c.id = s.client_id;
--i.
--?

--2.

--a.
CREATE VIEW amount AS
    SELECT date, COUNT (DISTINCT client_id), AVG (amount), SUM (amount)
    FROM sell
    GROUP BY date
    ORDER BY date;
--b.
CREATE VIEW top_5 AS
    SELECT date, SUM (amount)
    FROM sell
    GROUP BY DATE
    ORDER BY SUM (amount) desc limit 5;
--c.
CREATE VIEW dealer_sale AS
    SELECT dealer_id, COUNT (dealer_id), AVG (amount), SUM (amount)
    FROM sell
    GROUP BY dealer_id
    ORDER BY dealer_id;


