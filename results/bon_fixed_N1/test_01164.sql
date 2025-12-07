SELECT h.location, COUNT(DISTINCT p.pilot_name) AS num_pilots, AVG(p.age) AS avg_age
FROM Hangar h
LEFT JOIN PilotSkills p ON h.plane_name = p.plane_name
GROUP BY h.location;
