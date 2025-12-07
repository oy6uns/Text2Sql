SELECT Channel_ID, Name 
FROM channel 
WHERE Channel_ID NOT IN (
    SELECT Channel_ID 
    FROM director_admin da 
    JOIN director d ON da.Director_ID = d.Director_ID 
    WHERE d.Name = 'Hank Baskett'
);
