SELECT rating, AVG(age) AS average_age
FROM Sailors
WHERE sid IN (
  SELECT R.sid
  FROM Reserves R
  JOIN Boats B ON R.bid = B.bid
  WHERE B.color = 'red'
)
GROUP BY rating;
