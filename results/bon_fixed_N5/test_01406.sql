SELECT MIN(CAST(room_count AS INTEGER)) AS min_number_of_rooms FROM Properties WHERE room_count IS NOT NULL AND room_count <> '';
