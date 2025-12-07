SELECT DISTINCT a.name
FROM Author a
LEFT JOIN Author_list al ON a.author_id = al.author_id
LEFT JOIN Paper p ON al.paper_id = p.paper_id AND p.venue = 'ACL'
WHERE p.paper_id IS NULL;
