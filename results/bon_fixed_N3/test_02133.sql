SELECT staff_id, COUNT(*) AS meeting_count
FROM Staff_in_Meetings
GROUP BY staff_id
HAVING COUNT(*) = (
    SELECT MIN(meeting_count)
    FROM (
        SELECT staff_id, COUNT(*) AS meeting_count
        FROM Staff_in_Meetings
        GROUP BY staff_id
    ) AS counts
)
