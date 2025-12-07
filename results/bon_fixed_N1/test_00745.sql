SELECT voice_sound_quality, rhythm_tempo, stage_presence
FROM performance_score
JOIN participants ON performance_score.participant_id = participants.id
WHERE participants.name = 'Freeway';
