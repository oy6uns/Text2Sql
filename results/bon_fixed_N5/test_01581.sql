SELECT DISTINCT Flavor
FROM goods
WHERE Food = 'Cake'
AND Flavor NOT IN (
    SELECT Flavor
    FROM goods
    WHERE Food = 'Tart'
)
