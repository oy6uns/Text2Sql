SELECT SUM(u.Enrollment) 
FROM university u
JOIN overall_ranking o ON u.University_ID = o.University_ID
WHERE o.Rank <= 5;
