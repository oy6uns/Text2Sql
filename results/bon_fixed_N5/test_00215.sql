SELECT First_Name
FROM Students s
WHERE (SELECT COUNT(*) FROM Student_Answers sa WHERE sa.Student_ID = s.Student_ID) >= 2;
