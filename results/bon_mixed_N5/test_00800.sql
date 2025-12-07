SELECT country
FROM (
  SELECT City.country, COUNT(*) AS student_count
  FROM Student
  JOIN City ON Student.city_code = City.city_code
  GROUP BY City.country
) AS country_counts
ORDER BY student_count ASC
LIMIT 1;
