SELECT name FROM Vehicles WHERE id NOT IN (SELECT vehicles_id FROM Renting_history);
