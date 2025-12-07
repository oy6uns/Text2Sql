SELECT p.Name, COUNT(*) AS Number_of_Books
FROM book b
JOIN press p ON b.Press_ID = p.Press_ID
WHERE CAST(b.Sale_Amount AS INTEGER) > 1000
GROUP BY p.Name;
