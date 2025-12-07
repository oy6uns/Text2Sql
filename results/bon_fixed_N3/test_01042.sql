SELECT venue, year, COUNT(*) AS paper_count
FROM Paper
GROUP BY venue, year
ORDER BY venue, year;
