SELECT Title, Release_date 
FROM book 
ORDER BY CAST(Sale_Amount AS FLOAT) DESC 
LIMIT 5;
