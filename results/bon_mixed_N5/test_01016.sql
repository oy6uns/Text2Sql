SELECT A.name, COALESCE(SUM(C.citation_count), 0) AS num_citations
FROM Author A
JOIN Author_list AL ON A.author_id = AL.author_id
LEFT JOIN (
    SELECT cited_paper_id, COUNT(*) AS citation_count
    FROM Citation
    GROUP BY cited_paper_id
) C ON AL.paper_id = C.cited_paper_id
GROUP BY A.author_id, A.name
ORDER BY num_citations DESC
LIMIT 1;
