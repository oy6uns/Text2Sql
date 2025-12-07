SELECT r.Transmitter, COUNT(ccr.City_channel_ID) AS city_channel_count
FROM radio r
JOIN city_channel_radio ccr ON r.Radio_ID = ccr.Radio_ID
GROUP BY r.Transmitter;
