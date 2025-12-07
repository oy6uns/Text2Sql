SELECT DISTINCT pilot_name
FROM PilotSkills
WHERE pilot_name IN (
    SELECT pilot_name
    FROM PilotSkills
    WHERE plane_name = 'Piper Cub'
)
AND pilot_name NOT IN (
    SELECT pilot_name
    FROM PilotSkills
    WHERE plane_name = 'B-52 Bomber'
)
