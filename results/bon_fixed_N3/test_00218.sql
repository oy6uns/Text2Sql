SELECT Valid_Answer_Text
FROM Valid_Answers va
JOIN Student_Assessments sa ON va.Valid_Answer_ID = sa.Valid_Answer_ID
GROUP BY Valid_Answer_Text
ORDER BY COUNT(*) DESC
LIMIT 1;
