SELECT H.location
FROM Hangar H
JOIN PilotSkills P ON H.plane_name = P.plane_name
WHERE P.age = (SELECT MIN(age) FROM PilotSkills)
