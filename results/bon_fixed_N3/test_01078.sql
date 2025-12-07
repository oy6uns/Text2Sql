SELECT name FROM staff WHERE Age > (SELECT AVG(Age) FROM staff)
