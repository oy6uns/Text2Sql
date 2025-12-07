SELECT meeting_id, COUNT(staff_id) AS number_of_staff
FROM Staff_in_Meetings
GROUP BY meeting_id;
