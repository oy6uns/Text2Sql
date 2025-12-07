SELECT A.deathYear
FROM Artists A
LEFT JOIN Paintings P ON A.artistID = P.painterID
GROUP BY A.artistID, A.deathYear
HAVING COUNT(P.paintingID) <= 3;
