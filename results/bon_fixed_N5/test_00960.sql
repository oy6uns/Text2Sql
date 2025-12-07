SELECT SUM(stock.Quantity) AS total_quantity
FROM stock
JOIN store ON stock.Store_ID = store.Store_ID
WHERE store.Name = 'Woodman';
