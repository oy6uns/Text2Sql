SELECT r.Transmitter, COUNT(DISTINCT ccr.City_channel_ID) AS number_of_city_channels
FROM radio r
JOIN city_channel_radio ccr ON r.Radio_ID = ccr.Radio_ID
GROUP BY r.Transmitter;
