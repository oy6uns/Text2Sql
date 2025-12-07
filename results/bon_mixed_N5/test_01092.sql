SELECT c.Conference_Name
FROM conference c
JOIN (
    SELECT Conference_ID
    FROM conference_participation
    GROUP BY Conference_ID
    ORDER BY COUNT(DISTINCT staff_ID) DESC
    LIMIT 2
) top_confs ON c.Conference_ID = top_confs.Conference_ID;
