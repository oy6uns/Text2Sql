SELECT Students.First_Name, Student_Answers.Date_of_Answer
FROM Students
JOIN Student_Answers ON Students.Student_ID = Student_Answers.Student_ID;
