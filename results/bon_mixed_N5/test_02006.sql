SELECT press.Name, SUM(CAST(book.Sale_Amount AS FLOAT)) AS Total_Sale_Amount
FROM press
JOIN book ON press.Press_ID = book.Press_ID
GROUP BY press.Name
