SELECT Home_Conference, COUNT(DISTINCT University_ID) AS University_Count
FROM university
GROUP BY Home_Conference;
