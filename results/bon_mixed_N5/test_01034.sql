SELECT a.name
FROM Author a
JOIN Author_list al ON a.author_id = al.author_id
WHERE a.name <> 'Mckeown , Kathleen'
AND al.paper_id IN (
    SELECT al2.paper_id
    FROM Author_list al2
    JOIN Author au2 ON al2.author_id = au2.author_id
    WHERE au2.name = 'Mckeown , Kathleen'
)
GROUP BY a.author_id, a.name
ORDER BY COUNT(DISTINCT al.paper_id) DESC
LIMIT 1;
