SELECT COUNT(DISTINCT a.author_id)
FROM Author a
WHERE NOT EXISTS (
    SELECT 1
    FROM Author_list al
    JOIN Citation c ON al.paper_id = c.cited_paper_id
    WHERE al.author_id = a.author_id
    GROUP BY al.paper_id
    HAVING COUNT(c.paper_id) > 50
)
