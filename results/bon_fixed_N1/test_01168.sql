SELECT h.location
FROM Hangar h
JOIN PilotSkills p ON h.plane_name = p.plane_name
WHERE p.age = (SELECT MIN(age) FROM PilotSkills)
