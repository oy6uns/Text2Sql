SELECT DISTINCT b1.Completed_Year
FROM building b1
WHERE b1.Number_of_Stories > 20
AND EXISTS (
    SELECT 1
    FROM building b2
    WHERE b2.Completed_Year = b1.Completed_Year
    AND b2.Number_of_Stories < 15
)
ORDER BY b1.Completed_Year;
