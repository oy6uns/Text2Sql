SELECT DISTINCT b1.Book_Series
FROM book b1
WHERE CAST(b1.Sale_Amount AS INTEGER) > 1000
  AND b1.Book_Series IN (
    SELECT b2.Book_Series
    FROM book b2
    WHERE CAST(b2.Sale_Amount AS INTEGER) < 500
  ) AND b1.Book_Series IS NOT NULL;
