SELECT p.title
FROM Paper p
JOIN Author_list al ON p.paper_id = al.paper_id
GROUP BY p.paper_id, p.title
ORDER BY COUNT(DISTINCT al.author_id) DESC
LIMIT 1;
