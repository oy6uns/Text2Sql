SELECT a.agency_id, a.agency_details
FROM Agencies a
JOIN (
    SELECT agency_id, COUNT(*) AS staff_count
    FROM Staff
    GROUP BY agency_id
    ORDER BY staff_count DESC
    LIMIT 1
) s ON a.agency_id = s.agency_id;
