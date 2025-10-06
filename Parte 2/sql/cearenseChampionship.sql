DROP TABLE IF EXISTS matches;
DROP TABLE IF EXISTS teams;

CREATE TABLE teams (
    id integer PRIMARY KEY,
    name varchar(50)
);

CREATE TABLE matches  (
    id integer PRIMARY KEY,
    team_1 integer,
    team_2 integer,
    team_1_goals integer,
    team_2_goals integer,
    FOREIGN KEY (team_1) REFERENCES teams(id),
    FOREIGN KEY (team_2) REFERENCES teams(id)
);

insert into teams (id, name)
values
    (1,'CEARA'),
    (2,'FORTALEZA'),
    (3,'GUARANY DE SOBRAL'),
    (4,'FLORESTA');

insert into  matches (id, team_1, team_2, team_1_goals, team_2_goals)
values
    (1,4,1,0,4),
    (2,3,2,0,1),
    (3,1,3,3,0),
    (4,3,4,0,1),
    (5,1,2,0,0),
    (6,2,4,2,1);


WITH match_results AS (
	SELECT 
	name,
	CASE WHEN m.team_1_goals > m.team_2_goals THEN 'Victory'
		 WHEN m.team_1_goals < m.team_2_goals THEN 'Defeat'
		 ELSE 'Draw'
		 END AS result
	FROM teams t
	INNER JOIN matches m ON m.team_1 = t.id
	UNION ALL
	SELECT 
	name,
	CASE WHEN m.team_1_goals < m.team_2_goals THEN 'Victory'
		 WHEN m.team_1_goals > m.team_2_goals THEN 'Defeat'
		 ELSE 'Draw'
		 END AS result
	FROM teams t
	INNER JOIN matches m ON m.team_2 = t.id
)
SELECT
    name,
    COUNT(*) AS matches,
    COUNT(*) FILTER (WHERE result = 'Victory') AS victories,
    COUNT(*) FILTER (WHERE result = 'Defeat') AS defeats,
    COUNT(*) FILTER (WHERE result = 'Draw') AS draws,
    (COUNT(*) FILTER (WHERE result = 'Victory') * 3 
     + COUNT(*) FILTER (WHERE result = 'Draw')) AS score
FROM match_results
GROUP BY name
ORDER BY score DESC;
