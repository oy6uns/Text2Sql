SELECT paper_id, COUNT(*) AS num_citations
FROM Citation
GROUP BY paper_id
ORDER BY num_citations DESC
LIMIT 1;
