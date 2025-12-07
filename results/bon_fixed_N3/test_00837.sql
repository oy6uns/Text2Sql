WITH Linda AS (
  SELECT S.city_code
  FROM Student S
  WHERE S.Fname = 'Linda' AND S.LName = 'Smith'
), LindaCity AS (
  SELECT C.latitude, C.longitude, C.city_code
  FROM City C
  JOIN Linda L ON C.city_code = L.city_code
), Distances AS (
  SELECT 
    S.StuID,
    S.Fname,
    S.LName,
    C.latitude,
    C.longitude,
    C.city_code,
    SQRT(POWER(C.latitude - LC.latitude, 2) + POWER(C.longitude - LC.longitude, 2)) AS dist
  FROM Student S
  JOIN City C ON S.city_code = C.city_code
  CROSS JOIN LindaCity LC
)
SELECT Fname, LName
FROM Distances
ORDER BY dist DESC
LIMIT 1;
