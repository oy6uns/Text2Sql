WITH GenderCounts AS (
  SELECT gender_code, COUNT(*) AS cnt
  FROM Customers
  GROUP BY gender_code
),
MinCount AS (
  SELECT MIN(cnt) AS min_cnt
  FROM GenderCounts
)
SELECT email_address, town_city, county
FROM Customers
WHERE gender_code IN (
  SELECT gender_code
  FROM GenderCounts, MinCount
  WHERE GenderCounts.cnt = MinCount.min_cnt
)
