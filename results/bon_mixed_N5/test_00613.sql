SELECT Type, Title
FROM book
LEFT JOIN review ON book.Book_ID = review.Book_ID
WHERE review.Book_ID IS NULL;
