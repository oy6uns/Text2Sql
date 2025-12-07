SELECT DISTINCT p1.pilot_name
FROM PilotSkills p1
WHERE p1.age > (
    SELECT MIN(p2.age)
    FROM PilotSkills p2
    WHERE p2.plane_name = 'Piper Cub'
)
ORDER BY p1.pilot_name;
