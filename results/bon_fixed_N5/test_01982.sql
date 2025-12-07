SELECT Name
FROM press
WHERE Month_Profits_billion = (SELECT MAX(Month_Profits_billion) FROM press)
   OR Month_Profits_billion = (SELECT MIN(Month_Profits_billion) FROM press)
