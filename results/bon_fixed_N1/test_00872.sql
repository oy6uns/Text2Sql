SELECT sid, name FROM Sailors WHERE sid NOT IN (SELECT DISTINCT sid FROM Reserves);
