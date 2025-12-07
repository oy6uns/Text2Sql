SELECT Channel_ID, Name 
FROM channel 
WHERE Channel_ID NOT IN (
    SELECT Channel_ID 
    FROM director_admin 
    JOIN director ON director_admin.Director_ID = director.Director_ID 
    WHERE director.Name = 'Hank Baskett'
);
