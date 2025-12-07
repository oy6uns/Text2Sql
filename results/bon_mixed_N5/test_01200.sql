SELECT title FROM Sculptures WHERE year = (SELECT MAX(year) FROM Sculptures);
