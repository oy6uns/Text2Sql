SELECT DISTINCT i1.Province
FROM institution i1
JOIN institution i2 ON i1.Province = i2.Province
WHERE i1.Founded < 1920 AND i2.Founded > 1950;
