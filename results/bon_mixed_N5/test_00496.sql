SELECT bio_data
FROM Students
WHERE student_id = (
    SELECT student_id
    FROM Student_Loans
    ORDER BY amount_of_loan ASC
    LIMIT 1
)
