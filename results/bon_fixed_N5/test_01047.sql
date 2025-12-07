SELECT COUNT(DISTINCT a.author_id)
FROM Author a
WHERE a.author_id NOT IN (
    SELECT al.author_id
    FROM Author_list al
    JOIN Citation c ON al.paper_id = c.cited_paper_id
    GROUP BY al.author_id, al.paper_id
    HAVING COUNT(c.paper_id) > 50
)
