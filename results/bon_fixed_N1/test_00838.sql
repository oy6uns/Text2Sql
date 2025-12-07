WITH LindaCity AS (
  SELECT s.city_code
  FROM Student s
  WHERE s.Fname = 'Linda' AND s.LName = 'Smith'
),
Distances AS (
  SELECT s.StuID, s.Fname, s.LName, s.city_code,
         COALESCE(dd.distance, dd_rev.distance) AS dist
  FROM Student s
  LEFT JOIN Direct_distance dd ON dd.city1_code = (SELECT city_code FROM LindaCity) AND dd.city2_code = s.city_code
  LEFT JOIN Direct_distance dd_rev ON dd_rev.city2_code = (SELECT city_code FROM LindaCity) AND dd_rev.city1_code = s.city_code
  WHERE s.StuID <> (SELECT StuID FROM Student WHERE Fname = 'Linda' AND LName = 'Smith')
)
SELECT Fname || ' ' || LName AS full_name
FROM Distances
ORDER BY dist DESC NULLS LAST
LIMIT 1;
