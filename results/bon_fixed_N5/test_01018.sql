SELECT DISTINCT p.venue, p.year
FROM Paper p
JOIN Author_list al ON p.paper_id = al.paper_id
JOIN Author a ON al.author_id = a.author_id
WHERE a.name = 'Mckeown , Kathleen';
