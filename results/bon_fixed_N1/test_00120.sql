SELECT Name FROM director WHERE Age > (SELECT AVG(Age) FROM director)
