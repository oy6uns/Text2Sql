SELECT Vehicles.name
FROM Vehicles
JOIN Renting_history ON Vehicles.id = Renting_history.vehicles_id
GROUP BY Vehicles.name
ORDER BY SUM(Renting_history.total_hours) DESC;
