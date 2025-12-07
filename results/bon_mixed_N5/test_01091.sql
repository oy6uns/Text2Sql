SELECT Conference_Name
FROM (
    SELECT c.Conference_Name, COUNT(DISTINCT cp.staff_ID) AS attendants_count,
           DENSE_RANK() OVER (ORDER BY COUNT(DISTINCT cp.staff_ID) DESC) AS rank
    FROM conference c
    JOIN conference_participation cp ON c.Conference_ID = cp.Conference_ID
    GROUP BY c.Conference_Name
) ranked_conferences
WHERE rank <= 2;
