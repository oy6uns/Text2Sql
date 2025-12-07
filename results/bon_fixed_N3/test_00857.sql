SELECT DISTINCT Sailors.name, Sailors.sid
FROM Sailors
JOIN Reserves ON Sailors.sid = Reserves.sid;
