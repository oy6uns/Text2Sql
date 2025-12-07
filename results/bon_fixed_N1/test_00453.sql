SELECT s.student_details, rat.address_type_description
FROM Students s
JOIN Students_Addresses sa ON s.student_id = sa.student_id
JOIN Ref_Address_Types rat ON sa.address_type_code = rat.address_type_code;
