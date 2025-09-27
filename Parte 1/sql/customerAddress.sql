DROP TABLE IF EXISTS customers;

CREATE TABLE customers (
	id SERIAL PRIMARY KEY,
	name VARCHAR,
	street VARCHAR,
	city VARCHAR,
	state VARCHAR,
	credit_limit MONEY
);

INSERT INTO customers (name, street, city, state, credit_limit) VALUES
('Pedro Augusto da Rocha', 'Rua Pedro Carlos Hoffman', 'Porto Alegre', 'RS', '700,00'),
('Antonio Carlos Mamel', 'Av. Pinheiros', 'Belo Horizonte', 'MG', '3500,50'),
('Luiza Augusta Mhor', 'Rua Salto Grande', 'Niteroi', 'RJ', '4000,00'),
('Jane Ester', 'Av 7 de setembro', 'Erechim', 'RS', '800,00'),
('Marcos Antônio dos Santos', 'Av Farrapos', 'Porto Alegre', 'RS', '4250,25');

SELECT c.name, c.street
FROM customers c
WHERE c.city = 'Porto Alegre';