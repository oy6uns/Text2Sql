SELECT COUNT(*) AS staff_without_meetings
FROM Staff s
LEFT JOIN Staff_in_Meetings sim ON s.staff_id = sim.staff_id
WHERE sim.meeting_id IS NULL;
