SELECT AVG(CAST(room_count AS FLOAT)) AS average_number_of_rooms FROM Properties WHERE room_count IS NOT NULL;
