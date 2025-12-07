SELECT DISTINCT g1.Flavor
FROM goods g1
WHERE g1.Food = 'Cake'
  AND g1.Flavor NOT IN (
    SELECT DISTINCT g2.Flavor
    FROM goods g2
    WHERE g2.Food = 'Tart'
  )
