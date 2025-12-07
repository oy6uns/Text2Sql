SELECT sid FROM Sailors WHERE sid NOT IN (SELECT sid FROM Reserves);
