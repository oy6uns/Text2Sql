SELECT r.Transmitter, c.Station_name
FROM radio r
JOIN city_channel_radio ccr ON r.Radio_ID = ccr.Radio_ID
JOIN city_channel c ON ccr.City_channel_ID = c.ID
ORDER BY TRY_TO_NUMBER(r.ERP_kW) DESC;
