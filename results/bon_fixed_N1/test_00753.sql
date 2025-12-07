SELECT s.id, s.name
FROM songs s
JOIN performance_score ps ON s.id = ps.songs_id
GROUP BY s.id, s.name
ORDER BY COUNT(DISTINCT ps.participant_id) DESC
LIMIT 1;
