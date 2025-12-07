SELECT Id
FROM goods
WHERE Price > 2 * (SELECT AVG(Price) FROM goods)
