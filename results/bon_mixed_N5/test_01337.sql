SELECT d.Driver_Name, d.Age
FROM driver d
JOIN (
  SELECT Driver_ID
  FROM race
  GROUP BY Driver_ID
  HAVING COUNT(*) >= 2
) r ON d.Driver_ID = r.Driver_ID;
