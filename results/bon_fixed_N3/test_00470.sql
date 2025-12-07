SELECT A.achievement_details, RAT.achievement_type_description
FROM Achievements A
JOIN Ref_Achievement_Type RAT ON A.achievement_type_code = RAT.achievement_type_code;
