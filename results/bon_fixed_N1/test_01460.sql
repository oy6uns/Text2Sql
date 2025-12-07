SELECT room_size, COUNT(*) AS count
FROM Rooms
GROUP BY room_size
ORDER BY room_size;
