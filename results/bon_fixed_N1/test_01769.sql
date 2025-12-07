SELECT Home_Conference, COUNT(*) AS Number_of_Universities
FROM university
GROUP BY Home_Conference
ORDER BY Number_of_Universities DESC;
