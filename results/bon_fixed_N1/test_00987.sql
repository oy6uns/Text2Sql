SELECT DISTINCT p.paper_id, p.title
FROM Paper p
JOIN Author_list al ON p.paper_id = al.paper_id
JOIN Author a ON al.author_id = a.author_id
WHERE a.name IN ('Mckeown, Kathleen', 'Rambow, Owen')
