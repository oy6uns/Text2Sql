SELECT DISTINCT earpads
FROM headphone
WHERE earpads NOT IN (
    SELECT earpads
    FROM headphone
    WHERE construction = 'plastic'
)
