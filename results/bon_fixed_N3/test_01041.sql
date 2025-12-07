SELECT year, COUNT(DISTINCT venue) AS num_conferences FROM Paper GROUP BY year ORDER BY year;
