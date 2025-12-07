SELECT MIN(CAST(room_count AS INTEGER)) AS minimum_number_of_rooms FROM Properties WHERE room_count IS NOT NULL AND TRY_CAST(room_count AS INTEGER) IS NOT NULL;
