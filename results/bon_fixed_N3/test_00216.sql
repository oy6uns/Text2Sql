SELECT First_Name
FROM Students s
JOIN Student_Answers sa ON s.Student_ID = sa.Student_ID
GROUP BY First_Name, s.Student_ID
HAVING COUNT(sa.Student_Answer_ID) >= 2;
