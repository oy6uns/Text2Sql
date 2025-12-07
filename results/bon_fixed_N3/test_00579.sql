SELECT a.Name
FROM Author a
JOIN Author_Book ab ON a.idAuthor = ab.Author
JOIN Book b ON ab.ISBN = b.ISBN
WHERE b.Title = 'Pride and Prejudice';
