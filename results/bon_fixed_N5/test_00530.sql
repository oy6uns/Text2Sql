SELECT b.Title, a.Name
FROM Book b
JOIN Author_Book ab ON b.ISBN = ab.ISBN
JOIN Author a ON ab.Author = a.idAuthor;
