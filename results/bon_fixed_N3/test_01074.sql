SELECT 
    i.Institution_ID, 
    COUNT(s.staff_ID) AS staff_count, 
    STRING_AGG(s.name, ', ') AS staff_names
FROM 
    institution i
JOIN 
    staff s ON i.Institution_ID = s.Institution_ID
WHERE 
    i.Founded > 1800
GROUP BY 
    i.Institution_ID;
