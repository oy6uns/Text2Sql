SELECT paper.paper_id, paper.title
FROM Paper paper
LEFT JOIN Citation citation ON paper.paper_id = citation.cited_paper_id
WHERE citation.cited_paper_id IS NULL;
