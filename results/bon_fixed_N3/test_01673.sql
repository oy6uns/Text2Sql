SELECT C.Nickname
FROM Championship C
JOIN institution I ON C.Institution_ID = I.Institution_ID
ORDER BY I.Capacity DESC;
