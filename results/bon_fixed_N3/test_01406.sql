SELECT MIN(CAST(room_count AS INTEGER)) AS min_rooms FROM Properties WHERE room_count IS NOT NULL;
