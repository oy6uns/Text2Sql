SELECT a.address_details, s.bio_data
FROM Students s
JOIN Students_Addresses sa ON s.student_id = sa.student_id
JOIN Addresses a ON sa.address_id = a.address_id;
