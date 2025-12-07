SELECT ps.pilot_name, ps.age
FROM PilotSkills ps
JOIN Hangar h ON ps.plane_name = h.plane_name
WHERE h.location = 'Austin'
