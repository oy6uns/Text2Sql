SELECT DISTINCT p.paper_id, p.title
FROM Paper p
JOIN Author_list al1 ON p.paper_id = al1.paper_id
JOIN Author a1 ON al1.author_id = a1.author_id
JOIN Author_list al2 ON p.paper_id = al2.paper_id
JOIN Author a2 ON al2.author_id = a2.author_id
WHERE a1.name = 'Mckeown, Kathleen' 
  AND a2.name = 'Rambow, Owen';
