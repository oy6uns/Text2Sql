SELECT b.Number_of_Stories
FROM building b
JOIN region r ON b.Region_ID = r.Region_ID
WHERE r.Name = 'Abruzzo';
