SELECT agency_id, agency_details
FROM Agencies
WHERE agency_id = (
    SELECT agency_id
    FROM Staff
    GROUP BY agency_id
    ORDER BY COUNT(*) DESC
    LIMIT 1
)
