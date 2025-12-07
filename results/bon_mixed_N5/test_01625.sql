SELECT Make
FROM driver
GROUP BY Make
HAVING COUNT(*) = (
  SELECT MAX(driver_count)
  FROM (
    SELECT COUNT(*) AS driver_count
    FROM driver
    GROUP BY Make
  ) sub
)
