SELECT V.name, SUM(R.total_hours) AS total_rental_hours
FROM Vehicles V
LEFT JOIN Renting_history R ON V.id = R.vehicles_id
GROUP BY V.name;
