SELECT location, COUNT(*) AS painting_count
FROM Paintings
WHERE year < 1900
GROUP BY location;
