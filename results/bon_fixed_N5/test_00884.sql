SELECT name, age FROM Sailors WHERE age = (SELECT MAX(age) FROM Sailors);
