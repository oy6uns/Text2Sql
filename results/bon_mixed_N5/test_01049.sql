SELECT DISTINCT a1.name
FROM Author a1
JOIN Author_list al1 ON a1.author_id = al1.author_id
JOIN Paper p1 ON al1.paper_id = p1.paper_id
JOIN Author_list al2 ON a1.author_id = al2.author_id
JOIN Paper p2 ON al2.paper_id = p2.paper_id
WHERE p1.venue = 'NAACL' AND p1.year = 2009
  AND p2.venue = 'ACL' AND p2.year = 2009
