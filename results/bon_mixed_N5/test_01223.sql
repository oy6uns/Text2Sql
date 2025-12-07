SELECT MIN(deathYear - birthYear) AS shortest_lifespan FROM Artists WHERE deathYear IS NOT NULL AND birthYear IS NOT NULL;
