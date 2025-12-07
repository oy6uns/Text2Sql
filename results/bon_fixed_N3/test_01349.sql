SELECT Driver_Name 
FROM driver 
WHERE Driver_ID NOT IN (SELECT DISTINCT Driver_ID FROM race);
