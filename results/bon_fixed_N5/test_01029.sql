SELECT title
FROM Paper
JOIN (
    SELECT paper_id, COUNT(DISTINCT author_id) AS author_count
    FROM Author_list
    GROUP BY paper_id
    ORDER BY author_count DESC
    LIMIT 1
) AS sub ON Paper.paper_id = sub.paper_id;
