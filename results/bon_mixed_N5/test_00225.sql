SELECT First_Name
FROM Students s
LEFT JOIN Student_Answers sa ON s.Student_ID = sa.Student_ID
WHERE sa.Student_Answer_ID IS NULL;
