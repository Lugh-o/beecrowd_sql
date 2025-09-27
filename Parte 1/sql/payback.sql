DROP TABLE IF EXISTS operations;
DROP TABLE IF EXISTS clients;

CREATE TABLE clients (
    id SERIAl PRIMARY KEY,
    name VARCHAR(50),
    investment NUMERIC
);

CREATE TABLE operations (
    id SERIAL PRIMARY KEY,
    client_id INTEGER REFERENCES clients(id),
    month INTEGER,
    profit NUMERIC
);

INSERT INTO clients (name, investment) VALUES
('Daniel', 500),
('Oliveira', 2000),
('Lucas', 1000);

INSERT INTO operations (client_id, month, profit) VALUES
(1, 1, 230),
(2, 1, 1000),
(2, 2, 1000),
(3, 1, 100),
(3, 2, 300),
(3, 3, 900),
(3, 4, 400);


WITH cumulative_operations AS (
	SELECT 
		client_id, 
		month, 
		profit,
		SUM(profit) OVER (PARTITION BY client_id ORDER BY month) AS cumulative_profit
	FROM operations
),
payback AS (
	SELECT 
		c.id AS client_id,
		MIN(o.month) AS month_of_payback
	FROM cumulative_operations o
	INNER JOIN clients c ON o.client_id = c.id
	WHERE cumulative_profit >= c.investment
	GROUP BY c.id
)
SELECT
	c.name,
	c.investment,
	p.month_of_payback,
	(o.cumulative_profit - c.investment) AS return
FROM payback p
INNER JOIN clients c ON p.client_id = c.id
INNER JOIN cumulative_operations o ON o.client_id = c.id AND o.month = p.month_of_payback
ORDER BY return DESC;
