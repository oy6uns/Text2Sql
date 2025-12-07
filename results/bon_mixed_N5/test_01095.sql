SELECT Institution_Name, Location
FROM institution
WHERE Institution_ID NOT IN (
    SELECT DISTINCT s.Institution_ID
    FROM staff s
    JOIN conference_participation cp ON s.staff_ID = cp.staff_ID
    JOIN conference c ON cp.Conference_ID = c.Conference_ID
    WHERE c.Year = 2004
);
