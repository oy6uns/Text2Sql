SELECT COUNT(*) AS num_channels_without_programs
FROM channel c
LEFT JOIN program p ON c.Channel_ID = p.Channel_ID
WHERE p.Program_ID IS NULL;
