SELECT COUNT(*) 
FROM PilotSkills 
WHERE plane_name IN (
    SELECT plane_name 
    FROM PilotSkills 
    GROUP BY plane_name 
    HAVING AVG(age) < 35
)
