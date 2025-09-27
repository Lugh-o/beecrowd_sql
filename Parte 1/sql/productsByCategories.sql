DROP TABLE IF EXISTS products;
DROP TABLE IF EXISTS categories;

CREATE TABLE categories (
    id SERIAL PRIMARY KEY,
    name VARCHAR(255)
);

CREATE TABLE products (
    id SERIAL PRIMARY KEY,
    name VARCHAR(255),
    amount INTEGER,
    price NUMERIC,
    id_categories INTEGER REFERENCES categories(id)
);

INSERT INTO categories (name) VALUES
('wood'),
('luxury'),
('vintage'),
('modern'),
('super luxury');

INSERT INTO products (name, amount, price, id_categories) VALUES
('Two-doors wardrobe', 100, 800, 1),
('Dining table', 1000, 560, 3),
('Towel holder', 10000, 25.50, 4),
('Computer desk', 350, 320.50, 2),
('Chair', 3000, 210.64, 4),
('Single bed', 750, 460, 1);


SELECT 
c.name,
SUM(p.amount)
FROM categories c
INNER JOIN products p ON p.id_categories = c.id
GROUP BY c.name;