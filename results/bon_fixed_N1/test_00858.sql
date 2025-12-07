SELECT DISTINCT Sailors.sid, Sailors.name
FROM Sailors
JOIN Reserves ON Sailors.sid = Reserves.sid;
