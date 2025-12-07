SELECT name FROM Vehicles WHERE id NOT IN (SELECT DISTINCT vehicles_id FROM Renting_history);
