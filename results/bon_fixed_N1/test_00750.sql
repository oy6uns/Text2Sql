SELECT p.id, p.name, p.popularity
FROM participants p
LEFT JOIN performance_score ps ON p.id = ps.participant_id
GROUP BY p.id, p.name, p.popularity
ORDER BY COUNT(ps.songs_id) DESC;
