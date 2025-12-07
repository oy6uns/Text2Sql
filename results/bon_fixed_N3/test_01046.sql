SELECT p.title
FROM Paper p
JOIN Citation c ON p.paper_id = c.cited_paper_id
GROUP BY p.paper_id, p.title
HAVING COUNT(c.paper_id) > 50;
