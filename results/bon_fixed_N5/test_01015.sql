SELECT a.name, COALESCE(SUM(citation_count), 0) AS total_citations
FROM Author a
JOIN Author_list al ON a.author_id = al.author_id
LEFT JOIN (
    SELECT p.paper_id, COUNT(c.paper_id) AS citation_count
    FROM Paper p
    LEFT JOIN Citation c ON p.paper_id = c.cited_paper_id
    GROUP BY p.paper_id
) pc ON al.paper_id = pc.paper_id
GROUP BY a.author_id, a.name
ORDER BY total_citations DESC
LIMIT 1;
