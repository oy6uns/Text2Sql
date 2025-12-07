SELECT Engine, COUNT(*) AS engine_count
FROM driver
GROUP BY Engine
ORDER BY engine_count DESC
LIMIT 1;
