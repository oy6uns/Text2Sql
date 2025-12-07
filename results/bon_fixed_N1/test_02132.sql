SELECT meeting_id, COUNT(staff_id) AS staff_count
FROM Staff_in_Meetings
GROUP BY meeting_id;
