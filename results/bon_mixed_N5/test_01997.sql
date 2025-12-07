SELECT DISTINCT a.Name
FROM author a
JOIN book b1 ON a.Author_ID = b1.Author_ID AND b1.Book_Series = 'MM'
JOIN book b2 ON a.Author_ID = b2.Author_ID AND b2.Book_Series = 'LT'
