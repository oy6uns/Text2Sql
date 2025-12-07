SELECT COUNT(*) AS not_performed_songs_count
FROM songs s
LEFT JOIN performance_score ps ON s.id = ps.songs_id
WHERE ps.songs_id IS NULL;
