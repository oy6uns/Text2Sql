SELECT DISTINCT s.name
FROM staff s
JOIN conference_participation cp ON s.staff_ID = cp.staff_ID
JOIN conference c ON cp.Conference_ID = c.Conference_ID
WHERE c.Year IN (2003, 2004)
