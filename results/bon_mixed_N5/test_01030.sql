SELECT p.title
FROM Paper p
JOIN (
    SELECT paper_id, COUNT(DISTINCT author_id) AS author_count
    FROM Author_list
    GROUP BY paper_id
) al ON p.paper_id = al.paper_id
WHERE al.author_count = (
    SELECT MAX(author_count)
    FROM (
        SELECT paper_id, COUNT(DISTINCT author_id) AS author_count
        FROM Author_list
        GROUP BY paper_id
    ) sub
)
