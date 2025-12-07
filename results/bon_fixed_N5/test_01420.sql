SELECT AVG(CAST(room_count AS FLOAT)) AS average_rooms_per_property FROM Properties WHERE room_count IS NOT NULL;
