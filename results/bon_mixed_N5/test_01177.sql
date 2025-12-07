SELECT COUNT(DISTINCT ps1.pilot_name)
FROM PilotSkills ps1
WHERE ps1.age > (
    SELECT MIN(ps2.age)
    FROM PilotSkills ps2
    JOIN Hangar h ON ps2.plane_name = h.plane_name
    WHERE h.plane_name = 'Piper Cub'
)
