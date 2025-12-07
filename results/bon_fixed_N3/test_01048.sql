SELECT COUNT(DISTINCT a.author_id)
FROM Author a
WHERE a.author_id NOT IN (
    SELECT al.author_id
    FROM Author_list al
    JOIN (
        SELECT paper_id
        FROM Citation
        GROUP BY paper_id
        HAVING COUNT(*) > 50
    ) c ON al.paper_id = c.paper_id
)
