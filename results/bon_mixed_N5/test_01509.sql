SELECT Food, AVG(Price) AS Average_Price, MAX(Price) AS Max_Price, MIN(Price) AS Min_Price FROM goods GROUP BY Food;
