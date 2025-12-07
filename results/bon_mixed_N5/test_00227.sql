SELECT Student_Answer_Text
FROM Student_Answers
WHERE Student_Answer_Text IN (
    SELECT Student_Answer_Text
    FROM Student_Answers
    WHERE Comments = 'Normal'
    INTERSECT
    SELECT Student_Answer_Text
    FROM Student_Answers
    WHERE Comments = 'Absent'
);
