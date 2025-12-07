SELECT meeting_outcome, COUNT(*) AS meeting_count
FROM Meetings
GROUP BY meeting_outcome;
