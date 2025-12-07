SELECT First_Name
FROM Students s
WHERE NOT EXISTS (
    SELECT 1
    FROM Student_Answers sa
    WHERE sa.Student_ID = s.Student_ID
)
