SELECT ps.plane_name, ps.pilot_name
FROM PilotSkills ps
JOIN (
    SELECT plane_name, MAX(age) AS max_age
    FROM PilotSkills
    GROUP BY plane_name
) max_ages ON ps.plane_name = max_ages.plane_name AND ps.age = max_ages.max_age
ORDER BY ps.plane_name;
