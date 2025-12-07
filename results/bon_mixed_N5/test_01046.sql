SELECT p.title
FROM Paper p
JOIN (
    SELECT cited_paper_id, COUNT(*) AS citation_count
    FROM Citation
    GROUP BY cited_paper_id
    HAVING COUNT(*) > 50
) c ON p.paper_id = c.cited_paper_id;
