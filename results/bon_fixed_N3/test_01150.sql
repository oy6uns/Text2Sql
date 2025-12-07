SELECT DISTINCT pilot_name
FROM PilotSkills
WHERE plane_name IN (SELECT plane_name FROM Hangar WHERE location = 'Austin')
  AND plane_name IN (SELECT plane_name FROM Hangar WHERE location = 'Boston');
