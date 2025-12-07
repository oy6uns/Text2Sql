SELECT DISTINCT p.name
FROM participants p
JOIN performance_score ps ON p.id = ps.participant_id
JOIN songs s ON ps.songs_id = s.id
WHERE s.language = 'English'
