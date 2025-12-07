SELECT radio.Transmitter, city_channel.Station_name
FROM radio
JOIN city_channel_radio ON radio.Radio_ID = city_channel_radio.Radio_ID
JOIN city_channel ON city_channel_radio.City_channel_ID = city_channel.ID
ORDER BY TRY_TO_NUMBER(radio.ERP_kW) DESC;
