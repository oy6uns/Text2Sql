SELECT H.location AS city, COUNT(PS.pilot_name) AS num_pilots, AVG(PS.age) AS avg_age
FROM PilotSkills PS
JOIN Hangar H ON PS.plane_name = H.plane_name
GROUP BY H.location;
