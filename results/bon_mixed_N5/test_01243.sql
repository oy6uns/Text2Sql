SELECT DISTINCT A.fname
FROM Artists A
JOIN Paintings P ON A.artistID = P.painterID
WHERE P.medium = 'oil' AND P.location = 'gallery 241'
