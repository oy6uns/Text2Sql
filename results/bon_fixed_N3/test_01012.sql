SELECT COUNT(*) 
FROM Citation c
JOIN Author_list al ON c.paper_id = al.paper_id
JOIN Author a ON al.author_id = a.author_id
WHERE a.name = 'Mckeown , Kathleen';
