SELECT p.name, p.popularity
FROM participants p
WHERE EXISTS (
    SELECT 1
    FROM performance_score ps
    JOIN songs s ON ps.songs_id = s.id
    WHERE ps.participant_id = p.id AND s.language = 'Croatian'
)
AND EXISTS (
    SELECT 1
    FROM performance_score ps
    JOIN songs s ON ps.songs_id = s.id
    WHERE ps.participant_id = p.id AND s.language = 'English'
)
