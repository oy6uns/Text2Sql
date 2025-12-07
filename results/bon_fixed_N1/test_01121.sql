SELECT COUNT(DISTINCT ps.pilot_name)
FROM PilotSkills ps
JOIN Hangar h ON ps.plane_name = h.plane_name
WHERE h.location = 'Chicago'
