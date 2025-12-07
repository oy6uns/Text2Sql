SELECT Email_Adress, Date_of_Answer
FROM Students
JOIN Student_Answers ON Students.Student_ID = Student_Answers.Student_ID
ORDER BY Date_of_Answer DESC;
