SELECT DISTINCT r.Transmitter
FROM radio r
LEFT JOIN city_channel_radio ccr ON r.Radio_ID = ccr.Radio_ID
WHERE ccr.Radio_ID IS NULL;
