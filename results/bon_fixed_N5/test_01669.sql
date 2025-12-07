SELECT Affiliation, COUNT(*) AS count FROM institution GROUP BY Affiliation ORDER BY count DESC LIMIT 1;
