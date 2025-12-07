SELECT s.Email_Adress, sa.Date_of_Answer
FROM Student_Answers sa
JOIN Students s ON sa.Student_ID = s.Student_ID
ORDER BY sa.Date_of_Answer DESC;
