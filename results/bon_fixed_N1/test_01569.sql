SELECT g1.Id
FROM goods g1
WHERE g1.Food = 'Cookie'
  AND g1.Price < (SELECT MIN(g2.Price) FROM goods g2 WHERE g2.Food = 'Croissant')
