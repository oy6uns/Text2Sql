SELECT COUNT(*) FROM songs s WHERE NOT EXISTS (SELECT 1 FROM performance_score ps WHERE ps.songs_id = s.id);
