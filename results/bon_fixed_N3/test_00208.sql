SELECT Student_Answer_Text, COUNT(*) AS Frequency
FROM Student_Answers
GROUP BY Student_Answer_Text
ORDER BY Frequency DESC;
