SELECT sl.amount_of_loan, sl.date_of_loan
FROM Student_Loans sl
JOIN (
    SELECT student_id
    FROM Achievements
    GROUP BY student_id
    HAVING COUNT(*) >= 2
) a ON sl.student_id = a.student_id;
