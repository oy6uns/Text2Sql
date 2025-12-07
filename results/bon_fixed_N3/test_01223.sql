SELECT MIN(deathYear - birthYear) AS shortest_life FROM Artists WHERE deathYear IS NOT NULL AND birthYear IS NOT NULL;
