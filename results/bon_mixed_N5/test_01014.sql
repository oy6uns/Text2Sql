SELECT COUNT(DISTINCT c.paper_id)
FROM Citation c
JOIN Paper p ON c.cited_paper_id = p.paper_id
JOIN Author_list al ON c.cited_paper_id = al.paper_id
JOIN Author a ON al.author_id = a.author_id
WHERE a.name = 'Mckeown , Kathleen';
