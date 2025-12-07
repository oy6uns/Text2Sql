WITH attendance_counts AS (
  SELECT 
    Conference_ID, 
    COUNT(staff_ID) AS attendants_count
  FROM conference_participation
  GROUP BY Conference_ID
), ranked_conferences AS (
  SELECT 
    Conference_ID, 
    attendants_count,
    DENSE_RANK() OVER (ORDER BY attendants_count DESC) AS rank
  FROM attendance_counts
)
SELECT c.Conference_Name
FROM ranked_conferences rc
JOIN conference c ON rc.Conference_ID = c.Conference_ID
WHERE rc.rank <= 2;
