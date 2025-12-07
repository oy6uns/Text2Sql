SELECT AVG(SalePrice) 
FROM Book 
WHERE ISBN IN (
  SELECT ISBN 
  FROM Author_Book 
  JOIN Author ON Author_Book.Author = Author.idAuthor 
  WHERE Author.Name = 'George Orwell'
)
