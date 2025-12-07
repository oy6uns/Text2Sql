SELECT a.name
FROM Author a
JOIN Author_list al ON a.author_id = al.author_id
GROUP BY a.author_id, a.name
HAVING COUNT(DISTINCT al.paper_id) > 50;
