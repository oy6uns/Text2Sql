SELECT g.Title, p.Platform_name
FROM game g
JOIN platform p ON g.Platform_ID = p.Platform_ID;
