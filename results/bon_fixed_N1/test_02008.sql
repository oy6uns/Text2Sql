SELECT p.Name, COUNT(b.Book_ID) AS Number_of_Books_Above_1000
FROM press p
LEFT JOIN book b ON p.Press_ID = b.Press_ID AND TRY_TO_NUMBER(b.Sale_Amount) > 1000
GROUP BY p.Name;
