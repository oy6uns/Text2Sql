SELECT client_id, meeting_type, COUNT(*) AS number_of_meetings
FROM Meetings
GROUP BY client_id, meeting_type
ORDER BY client_id, meeting_type;
