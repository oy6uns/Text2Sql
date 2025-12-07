SELECT MIN(deathYear) - birthYear AS age FROM Artists WHERE deathYear IS NOT NULL AND birthYear IS NOT NULL;
