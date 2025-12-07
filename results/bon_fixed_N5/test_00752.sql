SELECT voice_sound_quality
FROM performance_score ps
JOIN songs s ON ps.songs_id = s.id
WHERE s.name = ' The Balkan Girls ' AND s.language = 'English';
