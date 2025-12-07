SELECT room_size, COUNT(*) AS room_count
FROM Rooms
GROUP BY room_size
ORDER BY room_size;
