SELECT DISTINCT g1.Id
FROM goods g1
WHERE g1.Price < ANY (
  SELECT g2.Price
  FROM goods g2
  WHERE g2.Food = 'Tart'
)
