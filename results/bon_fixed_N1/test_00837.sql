WITH LindaCity AS (
  SELECT S.city_code
  FROM Student S
  WHERE S.Fname = 'Linda' AND S.LName = 'Smith'
), Distances AS (
  SELECT S.Fname, S.LName, D.distance
  FROM Student S
  JOIN LindaCity LC ON 1=1
  LEFT JOIN Direct_distance D ON 
    (D.city1_code = LC.city_code AND D.city2_code = S.city_code) OR
    (D.city2_code = LC.city_code AND D.city1_code = S.city_code)
  WHERE NOT (S.Fname = 'Linda' AND S.LName = 'Smith')
)
SELECT Fname, LName
FROM Distances
ORDER BY distance DESC NULLS LAST
LIMIT 1;
