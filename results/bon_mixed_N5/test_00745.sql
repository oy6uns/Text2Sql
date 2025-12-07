SELECT ps.voice_sound_quality, ps.rhythm_tempo, ps.stage_presence
FROM performance_score ps
JOIN participants p ON ps.participant_id = p.id
WHERE p.name = 'Freeway';
