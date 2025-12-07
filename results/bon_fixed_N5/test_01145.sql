SELECT pilot_name
FROM PilotSkills
WHERE plane_name IN ('Piper Cub', 'B-52 Bomber')
GROUP BY pilot_name
HAVING COUNT(DISTINCT plane_name) = 2;
