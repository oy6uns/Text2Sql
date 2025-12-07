SELECT plane_name, COUNT(pilot_name) AS num_pilots
FROM PilotSkills
GROUP BY plane_name
HAVING AVG(age) < 35;
