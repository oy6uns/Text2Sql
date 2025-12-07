SELECT a.author_id, a.name, COUNT(DISTINCT al.paper_id) AS paper_count
FROM Author a
LEFT JOIN Author_list al ON a.author_id = al.author_id
GROUP BY a.author_id, a.name
ORDER BY paper_count DESC;
