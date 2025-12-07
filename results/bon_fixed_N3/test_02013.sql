SELECT Name 
FROM author 
WHERE Author_ID NOT IN (
  SELECT Author_ID 
  FROM book 
  JOIN press ON book.Press_ID = press.Press_ID 
  WHERE press.Name = 'Accor'
)
