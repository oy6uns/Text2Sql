SELECT title
FROM Paper
WHERE paper_id = (
    SELECT paper_id
    FROM Author_list
    GROUP BY paper_id
    ORDER BY COUNT(author_id) DESC
    LIMIT 1
);
