SELECT DISTINCT c1.Nationality
FROM customer c1
JOIN customer c2 ON c1.Nationality = c2.Nationality
WHERE c1.Card_Credit < 50 AND c2.Card_Credit > 75;
