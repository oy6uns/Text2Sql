SELECT Vehicles.name, SUM(Renting_history.total_hours) AS total_rental_hours
FROM Vehicles
LEFT JOIN Renting_history ON Vehicles.id = Renting_history.vehicles_id
GROUP BY Vehicles.name;
