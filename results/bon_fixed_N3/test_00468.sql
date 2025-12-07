SELECT 
    se.event_type_code,
    ret.event_type_description,
    COUNT(DISTINCT se.student_id) AS number_of_students
FROM 
    Student_Events se
JOIN 
    Ref_Event_Types ret ON se.event_type_code = ret.event_type_code
GROUP BY 
    se.event_type_code,
    ret.event_type_description
ORDER BY 
    number_of_students DESC
LIMIT 1;
