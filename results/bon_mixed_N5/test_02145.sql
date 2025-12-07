SELECT 
  M.start_date_time, 
  M.end_date_time, 
  C.client_details, 
  S.staff_details
FROM Meetings M
JOIN Clients C ON M.client_id = C.client_id
JOIN Staff_in_Meetings SIM ON M.meeting_id = SIM.meeting_id
JOIN Staff S ON SIM.staff_id = S.staff_id;
