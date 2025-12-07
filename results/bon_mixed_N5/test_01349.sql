SELECT Driver_Name
FROM driver
LEFT JOIN race ON driver.Driver_ID = race.Driver_ID
WHERE race.Driver_ID IS NULL;
