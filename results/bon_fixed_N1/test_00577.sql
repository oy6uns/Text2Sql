SELECT Title
FROM Book
WHERE Author = 'Plato'
  AND SalePrice < (SELECT AVG(SalePrice) FROM Book)
