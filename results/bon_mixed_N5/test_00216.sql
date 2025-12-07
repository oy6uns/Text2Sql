SELECT First_Name 
FROM Students 
WHERE Student_ID IN (
    SELECT Student_ID 
    FROM Student_Answers 
    GROUP BY Student_ID 
    HAVING COUNT(Student_Answer_ID) >= 2
)
