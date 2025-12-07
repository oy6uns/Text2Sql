SELECT Title
FROM Book
WHERE SalePrice = (SELECT MIN(SalePrice) FROM Book)
