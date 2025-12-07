SELECT DISTINCT sa.Student_Answer_Text
FROM Student_Answers sa
WHERE sa.Student_Answer_Text IN (
    SELECT Student_Answer_Text
    FROM Student_Answers
    WHERE Comments = 'Normal'
)
AND sa.Student_Answer_Text IN (
    SELECT Student_Answer_Text
    FROM Student_Answers
    WHERE Comments = 'Absent'
)
