SELECT Valid_Answer_Text
FROM Valid_Answers VA
JOIN Student_Assessments SA ON VA.Valid_Answer_ID = SA.Valid_Answer_ID
GROUP BY Valid_Answer_Text
ORDER BY COUNT(*) DESC
LIMIT 1;
