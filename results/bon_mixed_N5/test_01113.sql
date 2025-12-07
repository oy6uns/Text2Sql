SELECT COUNT(DISTINCT ps.plane_name) 
FROM PilotSkills ps 
WHERE ps.plane_name = 'B-52 Bomber' AND ps.age < 35;
