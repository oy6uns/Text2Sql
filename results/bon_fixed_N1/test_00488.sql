SELECT student_id, bio_data, student_details
FROM Students
WHERE student_id IN (
    SELECT student_id
    FROM Classes
    GROUP BY student_id
    HAVING COUNT(DISTINCT class_id) = 2
)
