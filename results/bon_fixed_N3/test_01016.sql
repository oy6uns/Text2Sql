SELECT a.name, COUNT(c.paper_id) AS num_citations
FROM Author a
JOIN Author_list al ON a.author_id = al.author_id
JOIN Citation c ON al.paper_id = c.cited_paper_id
GROUP BY a.author_id, a.name
ORDER BY num_citations DESC
LIMIT 1;
