SELECT Exam_Date
FROM Exams
WHERE Subject_Code ILIKE '%data%'
ORDER BY Exam_Date DESC;
