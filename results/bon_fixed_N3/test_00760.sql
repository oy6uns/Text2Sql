SELECT DISTINCT s.original_artist
FROM songs s
JOIN performance_score p ON s.id = p.songs_id
WHERE p.rhythm_tempo > 5
ORDER BY p.voice_sound_quality DESC;
