SELECT a.name
FROM Author a
JOIN Author_list al ON a.author_id = al.author_id
JOIN (
    SELECT al1.author_id, al2.author_id AS coauthor_id, al1.paper_id
    FROM Author_list al1
    JOIN Author_list al2 ON al1.paper_id = al2.paper_id AND al1.author_id <> al2.author_id
) coauth ON a.author_id = coauth.coauthor_id
JOIN Author m ON m.author_id = coauth.author_id
WHERE m.name = 'Mckeown , Kathleen'
GROUP BY a.name
ORDER BY COUNT(DISTINCT coauth.paper_id) DESC
LIMIT 1
