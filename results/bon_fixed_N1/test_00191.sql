SELECT COUNT(*) 
FROM driver 
WHERE Driver_ID NOT IN (SELECT DISTINCT Driver_ID FROM vehicle_driver);
