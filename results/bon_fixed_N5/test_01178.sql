SELECT COUNT(*) 
FROM PilotSkills 
WHERE age > (
    SELECT MIN(age) 
    FROM PilotSkills 
    WHERE plane_name = 'Piper Cub'
)
