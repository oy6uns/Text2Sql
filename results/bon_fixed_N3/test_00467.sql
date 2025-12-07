SELECT 
    COUNT(DISTINCT se.student_id) AS number_of_students,
    se.event_type_code,
    ret.event_type_description
FROM Student_Events se
JOIN Ref_Event_Types ret ON se.event_type_code = ret.event_type_code
GROUP BY se.event_type_code, ret.event_type_description
ORDER BY COUNT(se.student_id) DESC
LIMIT 1;
