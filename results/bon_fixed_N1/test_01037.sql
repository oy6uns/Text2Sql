SELECT paper_id, title
FROM Paper
WHERE paper_id NOT IN (SELECT cited_paper_id FROM Citation)
