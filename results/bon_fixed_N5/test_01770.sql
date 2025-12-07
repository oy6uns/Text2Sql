SELECT Home_Conference, COUNT(*) AS University_Count
FROM university
GROUP BY Home_Conference
ORDER BY Home_Conference;
