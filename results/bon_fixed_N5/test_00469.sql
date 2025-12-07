SELECT a.achievement_details, rat.achievement_type_description
FROM Achievements a
JOIN Ref_Achievement_Type rat ON a.achievement_type_code = rat.achievement_type_code;
