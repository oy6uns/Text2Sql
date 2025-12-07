SELECT p.id, p.name
FROM participants p
JOIN performance_score ps ON p.id = ps.participant_id
GROUP BY p.id, p.name
HAVING COUNT(DISTINCT ps.songs_id) >= 2;
