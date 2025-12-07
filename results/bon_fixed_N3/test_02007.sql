SELECT p.Name AS Press_Name, COUNT(*) AS Number_of_Books_Sold_More_Than_1000
FROM book b
JOIN press p ON b.Press_ID = p.Press_ID
WHERE TO_NUMBER(b.Sale_Amount) > 1000
GROUP BY p.Name;
