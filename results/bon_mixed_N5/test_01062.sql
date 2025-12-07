SELECT Year, COUNT(DISTINCT Conference_ID) AS number_of_conferences FROM conference GROUP BY Year ORDER BY Year;
