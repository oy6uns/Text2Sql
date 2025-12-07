SELECT songs.original_artist
FROM performance_score
JOIN songs ON performance_score.songs_id = songs.id
WHERE performance_score.rhythm_tempo > 5
ORDER BY performance_score.voice_sound_quality DESC;
