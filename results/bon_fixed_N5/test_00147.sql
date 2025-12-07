SELECT r.Transmitter, cc.City
FROM radio r
JOIN city_channel_radio ccr ON r.Radio_ID = ccr.Radio_ID
JOIN city_channel cc ON ccr.City_channel_ID = cc.ID;
