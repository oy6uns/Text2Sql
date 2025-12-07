SELECT d.Age
FROM driver d
JOIN (
    SELECT Driver_ID, COUNT(*) AS race_count
    FROM race
    GROUP BY Driver_ID
    ORDER BY race_count DESC
    LIMIT 1
) r ON d.Driver_ID = r.Driver_ID;
