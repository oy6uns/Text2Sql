SELECT Completed_Year
FROM building
WHERE Number_of_Stories > 20
INTERSECT
SELECT Completed_Year
FROM building
WHERE Number_of_Stories < 15;
