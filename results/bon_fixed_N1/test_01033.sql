SELECT a.name
FROM Author a
JOIN Author_list al ON a.author_id = al.author_id
JOIN (
    SELECT al2.paper_id
    FROM Author_list al2
    JOIN Author au ON al2.author_id = au.author_id
    WHERE au.name = 'Mckeown , Kathleen'
) mck_papers ON al.paper_id = mck_papers.paper_id
WHERE a.name <> 'Mckeown , Kathleen'
GROUP BY a.name
ORDER BY COUNT(DISTINCT al.paper_id) DESC
LIMIT 1;
