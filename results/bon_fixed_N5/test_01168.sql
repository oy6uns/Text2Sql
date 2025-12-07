SELECT H.location
FROM PilotSkills P
JOIN Hangar H ON P.plane_name = H.plane_name
WHERE P.age = (SELECT MIN(age) FROM PilotSkills)
