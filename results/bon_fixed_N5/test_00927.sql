SELECT Class, COUNT(*) AS Number_of_Headphones
FROM headphone
WHERE Price > 200
GROUP BY Class;
