SELECT AVG(d.Age) AS Average_Age
FROM driver d
JOIN country c ON d.Country = c.Country_Id
WHERE c.Official_native_language = 'English';
