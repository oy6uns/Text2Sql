SELECT AVG(room_count) AS average_number_of_rooms
FROM (
  SELECT property_id, COUNT(*) AS room_count
  FROM Rooms
  GROUP BY property_id
) subquery
