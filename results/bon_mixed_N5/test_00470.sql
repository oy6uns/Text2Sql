SELECT a.achievement_details, r.achievement_type_description
FROM Achievements a
JOIN Ref_Achievement_Type r ON a.achievement_type_code = r.achievement_type_code;
