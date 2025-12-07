SELECT p.name, p.popularity
FROM participants p
WHERE p.id IN (
    SELECT ps1.participant_id
    FROM performance_score ps1
    JOIN songs s1 ON ps1.songs_id = s1.id
    WHERE s1.language = 'Croatian'
)
AND p.id IN (
    SELECT ps2.participant_id
    FROM performance_score ps2
    JOIN songs s2 ON ps2.songs_id = s2.id
    WHERE s2.language = 'English'
)
