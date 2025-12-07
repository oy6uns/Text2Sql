SELECT Author.Name
FROM Author
JOIN Author_Book ON Author.idAuthor = Author_Book.Author
JOIN Book ON Author_Book.ISBN = Book.ISBN
WHERE Book.Title = 'Pride and Prejudice'
