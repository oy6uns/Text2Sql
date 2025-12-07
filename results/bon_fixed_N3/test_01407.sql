SELECT MIN(CAST(room_count AS INTEGER)) AS lowest_room_count FROM Properties WHERE room_count IS NOT NULL AND room_count <> '';
