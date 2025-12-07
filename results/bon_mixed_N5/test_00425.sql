SELECT name FROM Vehicles v LEFT JOIN Renting_history r ON v.id = r.vehicles_id WHERE r.id IS NULL;
