SELECT Paper.paper_id, Paper.title, COUNT(Citation.paper_id) AS citation_count
FROM Paper
LEFT JOIN Citation ON Paper.paper_id = Citation.cited_paper_id
GROUP BY Paper.paper_id, Paper.title
ORDER BY citation_count DESC
LIMIT 10;
