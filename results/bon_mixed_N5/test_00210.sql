SELECT s.First_Name, sa.Date_of_Answer
FROM Student_Answers sa
JOIN Students s ON sa.Student_ID = s.Student_ID;
