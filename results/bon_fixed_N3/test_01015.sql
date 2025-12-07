SELECT a.name, COALESCE(citation_counts.total_citations, 0) AS number_of_citations
FROM Author a
JOIN (
    SELECT al.author_id, COUNT(c.paper_id) AS total_citations
    FROM Author_list al
    JOIN Citation c ON al.paper_id = c.cited_paper_id
    GROUP BY al.author_id
) citation_counts ON a.author_id = citation_counts.author_id
ORDER BY citation_counts.total_citations DESC
LIMIT 1;
