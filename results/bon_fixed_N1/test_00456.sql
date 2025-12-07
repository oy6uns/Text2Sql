SELECT Addresses.address_details, Students.bio_data
FROM Students
JOIN Students_Addresses ON Students.student_id = Students_Addresses.student_id
JOIN Addresses ON Students_Addresses.address_id = Addresses.address_id;
