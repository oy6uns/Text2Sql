SELECT p.Name, p.Year_Profits_billion
FROM press p
JOIN book b ON p.Press_ID = b.Press_ID
GROUP BY p.Press_ID, p.Name, p.Year_Profits_billion
HAVING COUNT(b.Book_ID) > 2;
