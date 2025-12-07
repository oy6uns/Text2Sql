SELECT p.title
FROM Paper p
JOIN (
    SELECT paper_id, COUNT(DISTINCT author_id) AS author_count
    FROM Author_list
    GROUP BY paper_id
) a ON p.paper_id = a.paper_id
WHERE a.author_count = (
    SELECT MAX(author_count)
    FROM (
        SELECT paper_id, COUNT(DISTINCT author_id) AS author_count
        FROM Author_list
        GROUP BY paper_id
    ) sub
)
