SELECT SUM(stock.Quantity) AS total_headphones
FROM stock
JOIN store ON stock.Store_ID = store.Store_ID
WHERE store.Name = 'Woodman';
