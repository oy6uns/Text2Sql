SELECT H.location AS city, COUNT(DISTINCT P.pilot_name) AS number_of_pilots, AVG(P.age) AS average_age
FROM PilotSkills P
JOIN Hangar H ON P.plane_name = H.plane_name
GROUP BY H.location;
