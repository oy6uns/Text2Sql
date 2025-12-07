SELECT Student_Answer_Text, COUNT(*) AS frequency
FROM Student_Answers
GROUP BY Student_Answer_Text
ORDER BY frequency DESC;
