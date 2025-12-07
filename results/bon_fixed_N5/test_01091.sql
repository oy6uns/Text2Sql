WITH attendance_count AS (
  SELECT 
    Conference_ID, 
    COUNT(DISTINCT staff_ID) AS attendants
  FROM conference_participation
  GROUP BY Conference_ID
),
ranked_conferences AS (
  SELECT 
    Conference_ID, 
    attendants,
    DENSE_RANK() OVER (ORDER BY attendants DESC) AS rnk
  FROM attendance_count
)
SELECT c.Conference_Name
FROM conference c
JOIN ranked_conferences rc ON c.Conference_ID = rc.Conference_ID
WHERE rc.rnk <= 2;
