SELECT Conference_Name
FROM conference c
JOIN (
    SELECT Conference_ID, COUNT(DISTINCT staff_ID) AS attendee_count
    FROM conference_participation
    GROUP BY Conference_ID
    ORDER BY attendee_count DESC
    LIMIT 2
) cp ON c.Conference_ID = cp.Conference_ID
ORDER BY cp.attendee_count DESC;
