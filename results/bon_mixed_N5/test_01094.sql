SELECT name, Nationality
FROM staff
WHERE staff_ID NOT IN (
    SELECT cp.staff_ID
    FROM conference_participation cp
    JOIN conference c ON cp.Conference_ID = c.Conference_ID
    WHERE c.Conference_Name LIKE '%ACL%'
);
