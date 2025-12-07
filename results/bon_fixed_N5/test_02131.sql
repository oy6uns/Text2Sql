SELECT m.meeting_id, COUNT(sim.staff_id) AS number_of_staff
FROM Meetings m
LEFT JOIN Staff_in_Meetings sim ON m.meeting_id = sim.meeting_id
GROUP BY m.meeting_id;
