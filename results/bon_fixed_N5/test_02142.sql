SELECT DISTINCT s.staff_id, s.staff_details
FROM Staff s
JOIN Staff_in_Meetings sim ON s.staff_id = sim.staff_id
WHERE s.staff_details LIKE '%s%'
