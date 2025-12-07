SELECT Conference_Name
FROM conference
WHERE Conference_ID IN (
    SELECT Conference_ID
    FROM conference_participation
    GROUP BY Conference_ID
    ORDER BY COUNT(DISTINCT staff_ID) DESC
    LIMIT 2
)
