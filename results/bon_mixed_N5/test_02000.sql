SELECT Name FROM author LEFT JOIN book ON author.Author_ID = book.Author_ID WHERE book.Author_ID IS NULL;
