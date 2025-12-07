SELECT Paintings.title, Paintings.year
FROM Paintings
JOIN Artists ON Paintings.painterID = Artists.artistID
WHERE Artists.fname = 'Mary';
