SELECT Type_of_Question_Code, COUNT(*) AS Count
FROM Questions
GROUP BY Type_of_Question_Code;
