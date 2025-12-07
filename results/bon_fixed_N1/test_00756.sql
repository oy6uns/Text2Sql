SELECT s.language, AVG(p.rhythm_tempo) AS average_rhythm_score
FROM performance_score p
JOIN songs s ON p.songs_id = s.id
GROUP BY s.language;
