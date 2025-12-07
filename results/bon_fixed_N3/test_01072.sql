SELECT Institution_Name, Location
FROM institution
WHERE Founded = (SELECT MAX(Founded) FROM institution);
