SELECT COUNT(DISTINCT ps.pilot_name)
FROM PilotSkills ps
JOIN (
    SELECT plane_name
    FROM PilotSkills
    GROUP BY plane_name
    HAVING AVG(age) < 35
) avg_planes ON ps.plane_name = avg_planes.plane_name;
