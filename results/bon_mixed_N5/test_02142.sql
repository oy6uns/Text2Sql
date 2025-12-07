SELECT DISTINCT staff.staff_id, staff.staff_details
FROM Staff staff
JOIN Staff_in_Meetings sim ON staff.staff_id = sim.staff_id
WHERE staff.staff_details LIKE '%s%'
