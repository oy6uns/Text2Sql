SELECT p.paper_id, p.title
FROM Paper p
JOIN Author_list al ON p.paper_id = al.paper_id
JOIN Author a ON al.author_id = a.author_id
WHERE a.name LIKE '%Mckeown%'
AND p.paper_id NOT IN (
    SELECT paper_id
    FROM Author_list al2
    JOIN Author a2 ON al2.author_id = a2.author_id
    WHERE a2.name LIKE '%Rambow%'
)
