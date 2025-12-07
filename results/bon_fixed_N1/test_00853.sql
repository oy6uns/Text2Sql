SELECT sid FROM Sailors WHERE age > ALL (SELECT age FROM Sailors);
