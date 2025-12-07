SELECT COUNT(DISTINCT al2.author_id) AS collaborator_count
FROM Author a1
JOIN Author_list al1 ON a1.author_id = al1.author_id
JOIN Author_list al2 ON al1.paper_id = al2.paper_id AND al1.author_id <> al2.author_id
WHERE a1.name = 'Mckeown , Kathleen';
