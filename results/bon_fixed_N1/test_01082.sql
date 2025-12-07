SELECT DISTINCT c.Conference_Name
FROM conference c
JOIN conference_participation cp ON c.Conference_ID = cp.Conference_ID
JOIN staff s ON cp.staff_ID = s.staff_ID
WHERE s.Nationality = 'Canada'
