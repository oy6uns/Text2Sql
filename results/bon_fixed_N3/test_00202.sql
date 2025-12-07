SELECT Type_of_Question_Code, COUNT(*) AS occurrence_count
FROM Questions
GROUP BY Type_of_Question_Code;
