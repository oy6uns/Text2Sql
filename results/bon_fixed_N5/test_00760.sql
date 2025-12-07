SELECT DISTINCT s.original_artist
FROM songs s
JOIN performance_score ps ON s.id = ps.songs_id
WHERE ps.rhythm_tempo > 5
ORDER BY ps.voice_sound_quality DESC;
