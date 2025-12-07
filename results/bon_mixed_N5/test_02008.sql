SELECT p.Name, COUNT(CASE WHEN CAST(b.Sale_Amount AS INTEGER) > 1000 THEN 1 END) AS Number_of_Books
FROM press p
LEFT JOIN book b ON p.Press_ID = b.Press_ID
GROUP BY p.Name;
