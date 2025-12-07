SELECT ps.plane_name, ps.pilot_name
FROM PilotSkills ps
JOIN (
    SELECT plane_name, MAX(age) AS max_age
    FROM PilotSkills
    GROUP BY plane_name
) oldest ON ps.plane_name = oldest.plane_name AND ps.age = oldest.max_age
ORDER BY ps.plane_name;
