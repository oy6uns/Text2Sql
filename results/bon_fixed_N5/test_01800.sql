SELECT u.University_Name, o.Citation_point
FROM overall_ranking o
JOIN university u ON o.University_ID = u.University_ID
ORDER BY o.Reputation_point DESC
LIMIT 3;
