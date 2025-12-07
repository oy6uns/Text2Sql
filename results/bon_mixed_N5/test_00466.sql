SELECT DISTINCT s.bio_data, se.event_date
FROM Students s
JOIN Student_Events se ON s.student_id = se.student_id;
