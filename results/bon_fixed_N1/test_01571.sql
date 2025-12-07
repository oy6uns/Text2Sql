SELECT Id 
FROM goods 
WHERE Food = 'Cake' 
  AND Price >= (SELECT AVG(Price) FROM goods WHERE Food = 'Tart')
