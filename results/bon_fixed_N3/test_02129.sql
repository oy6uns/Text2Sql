SELECT 
  M.meeting_id, 
  M.meeting_outcome, 
  M.meeting_type, 
  C.client_details 
FROM Meetings M
JOIN Clients C ON M.client_id = C.client_id;
