SELECT d.Driver_Name, r.Race_Name
FROM driver d
JOIN race r ON d.Driver_ID = r.Driver_ID;
