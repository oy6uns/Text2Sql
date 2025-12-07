SELECT name FROM Sailors WHERE rating > ALL (SELECT rating FROM Sailors WHERE name = 'Luis');
