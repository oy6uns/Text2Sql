SELECT DISTINCT s.name
FROM staff s
JOIN conference_participation cp ON s.staff_ID = cp.staff_ID
JOIN conference c ON cp.Conference_ID = c.Conference_ID
WHERE c.Conference_Name = 'ACL'
AND s.staff_ID IN (
    SELECT cp2.staff_ID
    FROM conference_participation cp2
    JOIN conference c2 ON cp2.Conference_ID = c2.Conference_ID
    WHERE c2.Conference_Name = 'Naccl'
)
