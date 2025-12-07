SELECT Name FROM spokesman WHERE Spokesman_ID NOT IN (SELECT DISTINCT Spokesman_ID FROM spokesman_district);
