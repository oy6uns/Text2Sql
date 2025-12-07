SELECT s.Email_Adress, sa.Date_of_Answer
FROM Students s
JOIN Student_Answers sa ON s.Student_ID = sa.Student_ID
ORDER BY sa.Date_of_Answer DESC;
