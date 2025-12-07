SELECT p.paper_id, p.title
FROM Paper p
LEFT JOIN Citation c ON p.paper_id = c.cited_paper_id
WHERE c.cited_paper_id IS NULL;
