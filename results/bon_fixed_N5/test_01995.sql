SELECT DISTINCT b1.Book_Series
FROM book b1
JOIN book b2 ON b1.Book_Series = b2.Book_Series
WHERE CAST(b1.Sale_Amount AS NUMBER) > 1000
  AND CAST(b2.Sale_Amount AS NUMBER) < 500;
