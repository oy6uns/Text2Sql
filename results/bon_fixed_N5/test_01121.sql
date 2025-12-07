SELECT COUNT(DISTINCT pilot_name) 
FROM PilotSkills 
JOIN Hangar ON PilotSkills.plane_name = Hangar.plane_name 
WHERE Hangar.location = 'Chicago';
