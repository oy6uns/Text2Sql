WITH attendance_counts AS (
  SELECT 
    cp.Conference_ID, 
    COUNT(DISTINCT cp.staff_ID) AS num_attendants
  FROM conference_participation cp
  GROUP BY cp.Conference_ID
),
ranked_conferences AS (
  SELECT 
    Conference_ID, 
    num_attendants,
    DENSE_RANK() OVER (ORDER BY num_attendants DESC) AS rnk
  FROM attendance_counts
)
SELECT c.Conference_Name
FROM ranked_conferences rc
JOIN conference c ON rc.Conference_ID = c.Conference_ID
WHERE rc.rnk <= 2;
