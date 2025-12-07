SELECT DISTINCT pilot_name
FROM PilotSkills
WHERE age > (
    SELECT MAX(age)
    FROM PilotSkills
    WHERE plane_name = 'Piper Cub'
)
ORDER BY pilot_name;
