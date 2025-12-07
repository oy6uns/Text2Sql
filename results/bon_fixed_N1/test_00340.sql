SELECT b.Address, r.Name AS Region_Name
FROM building b
JOIN region r ON b.Region_ID = r.Region_ID;
