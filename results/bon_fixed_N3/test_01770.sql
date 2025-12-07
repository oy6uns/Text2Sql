SELECT Home_Conference, COUNT(DISTINCT University_ID) AS Number_of_Universities
FROM university
GROUP BY Home_Conference;
