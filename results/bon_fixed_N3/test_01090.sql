SELECT c.Conference_ID, c.Conference_Name, c.Year, COUNT(cp.staff_ID) AS number_of_participants
FROM conference c
LEFT JOIN conference_participation cp ON c.Conference_ID = cp.Conference_ID
GROUP BY c.Conference_ID, c.Conference_Name, c.Year;
