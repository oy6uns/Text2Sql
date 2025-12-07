SELECT Student_Answer_Text, COUNT(*) AS answer_count
FROM Student_Answers
GROUP BY Student_Answer_Text
ORDER BY answer_count DESC;
