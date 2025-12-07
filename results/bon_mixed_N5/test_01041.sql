SELECT year, COUNT(DISTINCT venue) AS number_of_conferences FROM Paper GROUP BY year ORDER BY year;
