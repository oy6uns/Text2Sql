SELECT a.name, COUNT(al.paper_id) AS number_of_papers
FROM Author a
JOIN Author_list al ON a.author_id = al.author_id
GROUP BY a.name
ORDER BY number_of_papers DESC;
