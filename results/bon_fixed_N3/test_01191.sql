SELECT Name FROM spokesman WHERE Points < (SELECT AVG(Points) FROM spokesman)
