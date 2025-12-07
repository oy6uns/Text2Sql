SELECT MIN(deathYear - birthYear) AS age_at_death FROM Artists WHERE deathYear IS NOT NULL AND birthYear IS NOT NULL;
