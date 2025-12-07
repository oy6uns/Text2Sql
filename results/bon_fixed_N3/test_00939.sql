SELECT DISTINCT earpads
FROM headphone
WHERE construction <> 'plastic'
  AND earpads NOT IN (
    SELECT earpads
    FROM headphone
    WHERE construction = 'plastic'
  )
