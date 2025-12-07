SELECT plane_name, pilot_name
FROM PilotSkills p1
WHERE age = (
    SELECT MAX(age)
    FROM PilotSkills p2
    WHERE p2.plane_name = p1.plane_name
)
