SELECT DISTINCT ps.stage_presence
FROM performance_score ps
JOIN songs s ON ps.songs_id = s.id
WHERE s.language = 'English'
