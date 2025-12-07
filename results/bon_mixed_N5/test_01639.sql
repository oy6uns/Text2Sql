SELECT Manager, Car_Owner
FROM team
WHERE Team_ID IN (
  SELECT Team_ID
  FROM team_driver
  GROUP BY Team_ID
  HAVING COUNT(Driver_ID) >= 2
);
