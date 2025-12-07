SELECT SUM(stock.Quantity) 
FROM stock 
JOIN store ON stock.Store_ID = store.Store_ID 
WHERE store.Name = 'Woodman';
