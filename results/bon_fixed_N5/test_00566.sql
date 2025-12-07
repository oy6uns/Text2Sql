SELECT Title
FROM Book
WHERE SalePrice > (SELECT AVG(SalePrice) FROM Book)
