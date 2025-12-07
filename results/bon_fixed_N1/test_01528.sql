SELECT DISTINCT Id, Price
FROM goods
WHERE Price < (SELECT AVG(Price) FROM goods)
