SELECT COUNT(DISTINCT al2.author_id) AS collaborator_count
FROM Author a
JOIN Author_list al1 ON a.author_id = al1.author_id
JOIN Author_list al2 ON al1.paper_id = al2.paper_id
WHERE a.name = 'Mckeown , Kathleen'
  AND al2.author_id <> a.author_id;
