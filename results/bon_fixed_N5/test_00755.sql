SELECT COUNT(*) FROM songs WHERE id NOT IN (SELECT DISTINCT songs_id FROM performance_score);
