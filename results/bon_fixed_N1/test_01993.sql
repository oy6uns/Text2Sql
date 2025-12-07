SELECT Title, Release_date
FROM book
ORDER BY TRY_TO_NUMBER(Sale_Amount) DESC
LIMIT 5;
