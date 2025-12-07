SELECT DISTINCT g.Id
FROM goods g
WHERE g.Price < (
    SELECT MIN(Price)
    FROM goods
    WHERE Food = 'Tart'
)
