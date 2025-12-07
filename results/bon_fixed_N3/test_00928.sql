SELECT Class, COUNT(*) AS Count_Headphones
FROM headphone
WHERE Price > 200
GROUP BY Class;
