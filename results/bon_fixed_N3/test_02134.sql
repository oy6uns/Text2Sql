SELECT staff_id
FROM Staff_in_Meetings
GROUP BY staff_id
HAVING COUNT(meeting_id) = (
    SELECT MIN(meeting_count) FROM (
        SELECT staff_id, COUNT(meeting_id) AS meeting_count
        FROM Staff_in_Meetings
        GROUP BY staff_id
        HAVING COUNT(meeting_id) > 0
    ) AS sub
)
