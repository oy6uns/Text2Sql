SELECT Age
FROM driver
WHERE Driver_ID = (
    SELECT Driver_ID
    FROM race
    GROUP BY Driver_ID
    ORDER BY COUNT(*) DESC
    LIMIT 1
);
