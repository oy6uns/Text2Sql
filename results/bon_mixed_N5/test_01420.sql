SELECT AVG(room_count) AS average_rooms_per_property
FROM (
  SELECT property_id, COUNT(*) AS room_count
  FROM Rooms
  GROUP BY property_id
) subquery;
