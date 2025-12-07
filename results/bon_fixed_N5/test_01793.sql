SELECT u.University_Name
FROM university u
JOIN overall_ranking o ON u.University_ID = o.University_ID
ORDER BY o.Reputation_point ASC;
