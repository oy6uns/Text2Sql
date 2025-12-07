SELECT r.Transmitter, cc.Station_name
FROM radio r
JOIN city_channel_radio ccr ON r.Radio_ID = ccr.Radio_ID
JOIN city_channel cc ON ccr.City_channel_ID = cc.ID
ORDER BY TRY_TO_NUMBER(r.ERP_kW) DESC;
