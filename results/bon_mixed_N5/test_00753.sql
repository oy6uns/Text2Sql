SELECT s.id, s.name
FROM songs s
JOIN (
    SELECT songs_id
    FROM performance_score
    GROUP BY songs_id
    ORDER BY COUNT(DISTINCT participant_id) DESC
    LIMIT 1
) ps ON s.id = ps.songs_id;
