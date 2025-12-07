SELECT DISTINCT p.id, p.name
FROM participants p
JOIN performance_score ps ON p.id = ps.participant_id
WHERE ps.voice_sound_quality = 5 OR ps.rhythm_tempo = 5;
