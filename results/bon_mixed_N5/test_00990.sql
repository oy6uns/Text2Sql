SELECT a.name, COUNT(DISTINCT al.paper_id) AS paper_count
FROM Author a
JOIN Author_list al ON a.author_id = al.author_id
GROUP BY a.name
ORDER BY paper_count DESC;
