SELECT location, COUNT(*) AS number_of_paintings FROM Paintings WHERE year < 1900 GROUP BY location;
