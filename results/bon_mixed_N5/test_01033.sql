SELECT a.name, COUNT(DISTINCT al.paper_id) AS coauthored_papers
FROM Author a
JOIN Author_list al ON a.author_id = al.author_id
JOIN (
    SELECT paper_id
    FROM Author_list al2
    JOIN Author au2 ON al2.author_id = au2.author_id
    WHERE au2.name = 'Mckeown , Kathleen'
) mcpapers ON al.paper_id = mcpapers.paper_id
WHERE a.name <> 'Mckeown , Kathleen'
GROUP BY a.name
ORDER BY coauthored_papers DESC
LIMIT 1;
