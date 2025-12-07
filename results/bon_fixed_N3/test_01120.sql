SELECT plane_name
FROM PilotSkills
GROUP BY plane_name
ORDER BY COUNT(*) ASC
LIMIT 1;
