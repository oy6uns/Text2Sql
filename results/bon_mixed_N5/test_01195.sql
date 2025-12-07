SELECT d.Name
FROM district d
JOIN spokesman_district sd1 ON d.District_ID = sd1.District_ID
JOIN spokesman s1 ON sd1.Spokesman_ID = s1.Spokesman_ID AND s1.Rank_position = 1
JOIN spokesman_district sd2 ON d.District_ID = sd2.District_ID
JOIN spokesman s2 ON sd2.Spokesman_ID = s2.Spokesman_ID AND s2.Rank_position = 2
GROUP BY d.Name;
