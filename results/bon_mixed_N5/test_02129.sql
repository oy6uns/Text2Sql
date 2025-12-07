SELECT 
    m.meeting_id, 
    m.meeting_outcome, 
    m.meeting_type, 
    c.client_details 
FROM 
    Meetings m
JOIN 
    Clients c ON m.client_id = c.client_id;
