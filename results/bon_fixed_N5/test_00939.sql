SELECT DISTINCT Earpads
FROM headphone
WHERE Headphone_ID NOT IN (
    SELECT Headphone_ID
    FROM headphone
    WHERE Construction = 'plastic'
);
