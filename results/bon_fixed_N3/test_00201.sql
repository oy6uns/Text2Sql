SELECT Type_of_Question_Code, COUNT(*) AS Question_Count
FROM Questions
GROUP BY Type_of_Question_Code
ORDER BY Question_Count DESC;
