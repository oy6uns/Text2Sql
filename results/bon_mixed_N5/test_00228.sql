SELECT DISTINCT sa.Student_Answer_Text
FROM Student_Answers sa
WHERE sa.Comments IN ('Normal', 'Absent')
GROUP BY sa.Student_Answer_Text
HAVING COUNT(DISTINCT sa.Comments) = 2
