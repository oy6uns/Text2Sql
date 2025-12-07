SELECT V.name, COALESCE(SUM(R.total_hours), 0) AS total_rental_hours
FROM Vehicles V
LEFT JOIN Renting_history R ON V.id = R.vehicles_id
GROUP BY V.name;
