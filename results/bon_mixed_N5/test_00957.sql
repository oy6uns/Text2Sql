SELECT h.Model
FROM headphone h
JOIN stock s ON h.Headphone_ID = s.Headphone_ID
GROUP BY h.Model
ORDER BY SUM(s.Quantity) DESC
LIMIT 1;
