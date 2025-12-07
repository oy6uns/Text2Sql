SELECT Type_of_Question_Code
FROM Questions
GROUP BY Type_of_Question_Code
HAVING COUNT(Question_ID) >= 3;
