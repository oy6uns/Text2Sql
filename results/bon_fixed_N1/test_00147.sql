SELECT r.Transmitter, c.City
FROM radio r
JOIN city_channel_radio ccr ON r.Radio_ID = ccr.Radio_ID
JOIN city_channel c ON ccr.City_channel_ID = c.ID;
