SELECT Manager, Sponsor
FROM team
WHERE Team_ID = (
    SELECT Team_ID
    FROM team_driver
    GROUP BY Team_ID
    ORDER BY COUNT(Driver_ID) DESC
    LIMIT 1
);
