SELECT teacher_id, teacher_details
FROM Teachers
WHERE teacher_id = (
    SELECT teacher_id
    FROM Classes
    GROUP BY teacher_id
    ORDER BY COUNT(class_id) DESC
    LIMIT 1
)
