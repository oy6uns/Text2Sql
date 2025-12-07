SELECT p.paper_id, p.title, COUNT(c.paper_id) AS citation_count
FROM Paper p
LEFT JOIN Citation c ON p.paper_id = c.cited_paper_id
GROUP BY p.paper_id, p.title
ORDER BY citation_count DESC
LIMIT 10;
