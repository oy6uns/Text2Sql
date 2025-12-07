SELECT p.name, p.popularity
FROM participants p
JOIN performance_score ps1 ON p.id = ps1.participant_id
JOIN songs s1 ON ps1.songs_id = s1.id AND s1.language = 'Croatian'
JOIN performance_score ps2 ON p.id = ps2.participant_id
JOIN songs s2 ON ps2.songs_id = s2.id AND s2.language = 'English'
GROUP BY p.id, p.name, p.popularity;
