SELECT client_id, COUNT(*) AS meeting_count
FROM Meetings
GROUP BY client_id;
