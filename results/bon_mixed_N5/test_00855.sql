SELECT DISTINCT name 
FROM Sailors 
WHERE age > (SELECT MAX(age) FROM Sailors WHERE rating > 7)
