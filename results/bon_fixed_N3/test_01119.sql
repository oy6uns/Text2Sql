SELECT plane_name
FROM PilotSkills
GROUP BY plane_name
ORDER BY COUNT(pilot_name) ASC
LIMIT 1;
