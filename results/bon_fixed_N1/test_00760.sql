SELECT DISTINCT s.original_artist
FROM performance_score ps
JOIN songs s ON ps.songs_id = s.id
WHERE ps.rhythm_tempo > 5
ORDER BY ps.voice_sound_quality DESC;
