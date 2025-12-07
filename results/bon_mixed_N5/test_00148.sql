SELECT radio.Transmitter, city_channel.Station_name
FROM city_channel_radio
JOIN radio ON city_channel_radio.Radio_ID = radio.Radio_ID
JOIN city_channel ON city_channel_radio.City_channel_ID = city_channel.ID
ORDER BY CAST(radio.ERP_kW AS FLOAT) DESC;
