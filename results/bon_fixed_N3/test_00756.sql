SELECT songs.language, AVG(performance_score.rhythm_tempo) AS average_rhythm_score
FROM songs
JOIN performance_score ON songs.id = performance_score.songs_id
GROUP BY songs.language;
