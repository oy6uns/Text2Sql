SELECT u.University_Name, o.Citation_point
FROM university u
JOIN overall_ranking o ON u.University_ID = o.University_ID
ORDER BY o.Reputation_point DESC
LIMIT 3;
