SELECT sid
FROM Reserves r
WHERE bid IN (SELECT bid FROM Boats WHERE color = 'red')
AND sid IN (
    SELECT sid FROM Reserves WHERE bid IN (SELECT bid FROM Boats WHERE color = 'blue')
)
