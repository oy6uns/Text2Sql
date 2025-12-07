SELECT a.name
FROM Author a
JOIN Author_list al ON a.author_id = al.author_id
JOIN (
    SELECT al1.author_id AS coauthor_id, COUNT(DISTINCT al1.paper_id) AS paper_count
    FROM Author_list al1
    JOIN Author_list al2 ON al1.paper_id = al2.paper_id AND al1.author_id <> al2.author_id
    JOIN Author au ON al2.author_id = au.author_id
    WHERE au.name = 'Mckeown , Kathleen'
    GROUP BY al1.author_id
) co ON a.author_id = co.coauthor_id
ORDER BY co.paper_count DESC
LIMIT 1
