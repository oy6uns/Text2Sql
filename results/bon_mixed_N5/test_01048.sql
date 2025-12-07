SELECT COUNT(DISTINCT a.author_id)
FROM Author a
WHERE a.author_id NOT IN (
    SELECT al.author_id
    FROM Author_list al
    JOIN (
        SELECT c.cited_paper_id, COUNT(c.paper_id) AS citation_count
        FROM Citation c
        GROUP BY c.cited_paper_id
        HAVING COUNT(c.paper_id) > 50
    ) pc ON al.paper_id = pc.cited_paper_id
)
