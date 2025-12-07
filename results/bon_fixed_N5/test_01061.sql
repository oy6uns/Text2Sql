SELECT Year, COUNT(Conference_ID) AS Number_of_Conferences
FROM conference
GROUP BY Year
ORDER BY Year;
