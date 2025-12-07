SELECT ps.plane_name, COUNT(ps.pilot_name) AS pilot_count
FROM PilotSkills ps
GROUP BY ps.plane_name
HAVING AVG(ps.age) < 35;
