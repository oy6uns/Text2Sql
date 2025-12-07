SELECT paper_id, COUNT(*) AS citation_count
FROM Citation
GROUP BY paper_id
ORDER BY citation_count DESC
LIMIT 1;
