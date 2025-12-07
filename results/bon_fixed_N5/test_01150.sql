SELECT DISTINCT p1.pilot_name
FROM PilotSkills p1
JOIN Hangar h1 ON p1.plane_name = h1.plane_name
WHERE h1.location = 'Austin'
AND EXISTS (
    SELECT 1
    FROM PilotSkills p2
    JOIN Hangar h2 ON p2.plane_name = h2.plane_name
    WHERE p2.pilot_name = p1.pilot_name AND h2.location = 'Boston'
)
