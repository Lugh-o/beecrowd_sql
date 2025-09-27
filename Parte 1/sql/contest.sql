DROP TABLE IF EXISTS score;
DROP TABLE IF EXISTS candidate;

CREATE TABLE candidate (
    id INTEGER PRIMARY KEY,
    name VARCHAR(255)
);

CREATE TABLE score (
    candidate_id INTEGER REFERENCES candidate(id),
    math NUMERIC,
    specific NUMERIC,
    project_plan NUMERIC
);

INSERT INTO candidate (id, name) VALUES
(1, 'Michael P Cannon'),
(2, 'Barbra J Cable'),
(3, 'Ronald D Jones'),
(4, 'Timothy K Fitzsimmons'),
(5, 'Ivory B Morrison'),
(6, 'Sheila R Denis'),
(7, 'Edward C Durgan'),
(8, 'William K Spencer'),
(9, 'Donna D Pursley'),
(10, 'Ann C Davis');

INSERT INTO score (candidate_id, math, specific, project_plan) VALUES
(1, 76, 58, 21),
(2, 4, 5, 22),
(3, 15, 59, 12),
(4, 41, 42, 99),
(5, 22, 90, 9),
(6, 82, 77, 15),
(7, 82, 99, 56),
(8, 11, 4, 22),
(9, 16, 29, 94),
(10, 1, 7, 59);

SELECT
c.name,
ROUND(((s.math * 2) + (s.specific * 3) + (s.project_plan * 5))/10, 2) AS average
FROM candidate c
INNER JOIN score s ON s.candidate_id = c.id
ORDER BY average DESC;
