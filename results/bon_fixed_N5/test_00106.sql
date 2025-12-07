WITH GenderCounts AS (
  SELECT gender_code, COUNT(*) AS gender_count
  FROM Customers
  GROUP BY gender_code
), MinCount AS (
  SELECT MIN(gender_count) AS min_gender_count
  FROM GenderCounts
), LeastCommonGenders AS (
  SELECT gender_code
  FROM GenderCounts, MinCount
  WHERE gender_count = min_gender_count
)
SELECT email_address, town_city, county
FROM Customers
WHERE gender_code IN (SELECT gender_code FROM LeastCommonGenders);
