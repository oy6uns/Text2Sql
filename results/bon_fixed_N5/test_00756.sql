SELECT s.language, AVG(ps.rhythm_tempo) AS average_rhythm_score
FROM songs s
JOIN performance_score ps ON s.id = ps.songs_id
GROUP BY s.language;
