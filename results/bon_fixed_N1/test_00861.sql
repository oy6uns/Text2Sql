SELECT DISTINCT R.sid
FROM Reserves R
JOIN Boats B ON R.bid = B.bid
WHERE B.color IN ('red', 'blue')
