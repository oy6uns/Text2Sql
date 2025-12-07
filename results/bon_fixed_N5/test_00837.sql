WITH Linda AS (
  SELECT s.city_code
  FROM Student s
  WHERE s.Fname = 'Linda' AND s.LName = 'Smith'
),
Distances AS (
  SELECT s.Fname, s.LName, dd.distance
  FROM Student s
  JOIN Linda l ON 1=1
  LEFT JOIN Direct_distance dd ON ( (s.city_code = dd.city1_code AND dd.city2_code = l.city_code) OR (s.city_code = dd.city2_code AND dd.city1_code = l.city_code) )
  WHERE s.Fname <> 'Linda' OR s.LName <> 'Smith'
)
SELECT Fname, LName
FROM Distances
ORDER BY distance DESC NULLS LAST
LIMIT 1;
