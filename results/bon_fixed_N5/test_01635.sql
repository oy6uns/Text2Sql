SELECT Country FROM country WHERE Country_Id NOT IN (SELECT DISTINCT Country FROM driver);
