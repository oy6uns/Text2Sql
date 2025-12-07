SELECT h.location
FROM PilotSkills p
JOIN Hangar h ON p.plane_name = h.plane_name
ORDER BY p.age ASC
LIMIT 1;
