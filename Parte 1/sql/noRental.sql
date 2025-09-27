DROP TABLE IF EXISTS locations;
DROP TABLE IF EXISTS customers;

CREATE TABLE customers (
	id SERIAL PRIMARY KEY,
	name VARCHAR,
	street VARCHAR,
	city VARCHAR
);

CREATE TABLE locations (
	id SERIAL PRIMARY KEY,
	locations_date DATE,
	id_customers INT REFERENCES customers(id)
);

INSERT INTO customers (name, street, city) VALUES
('Giovanna Goncalves Oliveira', 'Rua Mato Grosso', 'Canoas'),
('Kauã Azevedo Ribeiro', 'Travessa Ibiá', 'Uberlândia'),
('Rebeca Barbosa Santos', 'Rua Observatório Meteorológico', 'Salvador'),
('Sarah Carvalho Correia', 'Rua Antônio Carlos da Silva', 'Apucarana'),
('João Almeida Lima', 'Rua Rio Taiuva', 'Ponta Grossa'),
('Diogo Melo Dias', 'Rua Duzentos e Cinqüenta', 'Várzea Grande');

INSERT INTO locations (locations_date, id_customers) VALUES
('2016-09-02', 1),
('2016-08-02', 4),
('2016-09-02', 2),
('2016-03-02', 6),
('2016-04-04', 4);

SELECT
c.id,
c.name
FROM customers c
LEFT JOIN locations l ON l.id_customers = c.id
WHERE l.id IS null
ORDER BY c.id;


