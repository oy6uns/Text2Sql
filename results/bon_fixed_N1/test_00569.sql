SELECT Title 
FROM Book 
WHERE PurchasePrice = (SELECT MAX(PurchasePrice) FROM Book);
