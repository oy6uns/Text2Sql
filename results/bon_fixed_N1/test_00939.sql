SELECT DISTINCT Earpads
FROM headphone
WHERE Construction <> 'plastic' 
  AND Earpads NOT IN (
    SELECT Earpads 
    FROM headphone 
    WHERE Construction = 'plastic'
);
