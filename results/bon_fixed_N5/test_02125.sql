SELECT client_id, COUNT(*) AS number_of_meetings
FROM Meetings
GROUP BY client_id;
