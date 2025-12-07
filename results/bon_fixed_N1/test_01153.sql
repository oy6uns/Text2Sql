SELECT H.location AS plane_type, AVG(P.age) AS average_age
FROM PilotSkills P
JOIN Hangar H ON P.plane_name = H.plane_name
GROUP BY H.location;
