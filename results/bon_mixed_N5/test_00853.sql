SELECT sid FROM Sailors WHERE age = (SELECT MAX(age) FROM Sailors)
