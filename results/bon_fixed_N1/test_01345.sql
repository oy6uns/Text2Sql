SELECT Engine, COUNT(*) AS Engine_Count
FROM driver
GROUP BY Engine
ORDER BY Engine_Count DESC
LIMIT 1;
