SELECT a.name, COALESCE(cit.citation_count, 0) AS citation_count
FROM Author a
LEFT JOIN (
    SELECT al.author_id, COUNT(*) AS citation_count
    FROM Author_list al
    JOIN Citation ci ON al.paper_id = ci.cited_paper_id
    GROUP BY al.author_id
) cit ON a.author_id = cit.author_id
ORDER BY citation_count DESC
LIMIT 1;
