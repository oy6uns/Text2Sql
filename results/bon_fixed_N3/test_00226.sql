SELECT First_Name
FROM Students
WHERE Student_ID NOT IN (SELECT DISTINCT Student_ID FROM Student_Answers);
