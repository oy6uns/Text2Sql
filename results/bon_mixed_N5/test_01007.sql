SELECT p.title
FROM Paper p
JOIN (
    SELECT paper_id, COUNT(*) AS citation_count
    FROM Citation
    GROUP BY paper_id
    ORDER BY citation_count DESC
    LIMIT 1
) c ON p.paper_id = c.paper_id
