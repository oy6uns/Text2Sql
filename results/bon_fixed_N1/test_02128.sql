SELECT meeting_type, COUNT(*) AS meeting_count
FROM Meetings
GROUP BY meeting_type;
