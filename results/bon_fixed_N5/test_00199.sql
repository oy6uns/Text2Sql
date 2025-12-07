SELECT Exam_Date
FROM Exams
WHERE LOWER(Subject_Code) LIKE '%data%'
ORDER BY Exam_Date DESC;
