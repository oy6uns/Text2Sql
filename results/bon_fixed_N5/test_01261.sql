SELECT fname || ' ' || lname AS full_name
FROM Artists
JOIN Sculptures ON Artists.artistID = Sculptures.sculptorID
WHERE LOWER(Sculptures.title) LIKE '%female%';
