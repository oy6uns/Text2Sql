SELECT DISTINCT c1.Nationality
FROM customer c1
WHERE c1.Card_Credit < 50
  AND EXISTS (
    SELECT 1
    FROM customer c2
    WHERE c2.Nationality = c1.Nationality
      AND c2.Card_Credit > 75
  )
