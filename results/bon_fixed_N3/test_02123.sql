SELECT meeting_outcome, COUNT(*) AS number_of_meetings
FROM Meetings
GROUP BY meeting_outcome;
