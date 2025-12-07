SELECT COUNT(DISTINCT ps.plane_name)
FROM PilotSkills ps
WHERE ps.age < 35 AND ps.plane_name = 'B-52 Bomber'
