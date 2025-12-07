SELECT sid FROM Sailors WHERE age > (SELECT MIN(age) FROM Sailors);
