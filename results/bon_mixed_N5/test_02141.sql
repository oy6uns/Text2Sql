SELECT DISTINCT Staff.staff_id, Staff.staff_details
FROM Staff
JOIN Staff_in_Meetings ON Staff.staff_id = Staff_in_Meetings.staff_id
WHERE Staff.staff_details LIKE '%s%'
