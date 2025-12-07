SELECT S.sid, S.name
FROM Sailors S
JOIN (
  SELECT sid
  FROM Reserves
  GROUP BY sid
  HAVING COUNT(DISTINCT bid) > 1
) R ON S.sid = R.sid;
