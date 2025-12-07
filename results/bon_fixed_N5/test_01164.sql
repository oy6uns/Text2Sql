SELECT H.location, COUNT(DISTINCT P.pilot_name) AS num_pilots, AVG(P.age) AS avg_age
FROM Hangar H
LEFT JOIN PilotSkills P ON H.plane_name = P.plane_name
GROUP BY H.location;
