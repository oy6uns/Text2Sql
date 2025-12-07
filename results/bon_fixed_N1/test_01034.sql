SELECT a.name
FROM Author a
JOIN Author_list al ON a.author_id = al.author_id
WHERE a.name <> 'Mckeown , Kathleen'
AND al.paper_id IN (
    SELECT paper_id
    FROM Author_list
    WHERE author_id = (
        SELECT author_id
        FROM Author
        WHERE name = 'Mckeown , Kathleen'
    )
)
GROUP BY a.author_id, a.name
ORDER BY COUNT(DISTINCT al.paper_id) DESC
LIMIT 1;
