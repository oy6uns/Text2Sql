SELECT DISTINCT d1.Constructor
FROM driver d1
JOIN driver d2 ON d1.Constructor = d2.Constructor
WHERE d1.Age < 20 AND d2.Age > 30;
