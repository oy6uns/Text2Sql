SELECT DISTINCT g.Id
FROM goods g
WHERE g.Price < (SELECT MIN(g2.Price) FROM goods g2 WHERE g2.Food = 'Tart')
