SELECT DISTINCT a.name
FROM Author a
JOIN Author_list al ON a.author_id = al.author_id
JOIN Paper p ON al.paper_id = p.paper_id
WHERE p.year = 2009
  AND p.venue IN ('NAACL', 'ACL')
GROUP BY a.author_id, a.name
HAVING COUNT(DISTINCT p.venue) = 2;
