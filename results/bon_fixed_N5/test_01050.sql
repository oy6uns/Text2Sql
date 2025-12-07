SELECT DISTINCT a.name
FROM Author a
JOIN Author_list al ON a.author_id = al.author_id
JOIN Paper p ON al.paper_id = p.paper_id
WHERE p.year = 2009
  AND a.author_id IN (
    SELECT al1.author_id
    FROM Author_list al1
    JOIN Paper p1 ON al1.paper_id = p1.paper_id
    WHERE p1.venue = 'NAACL' AND p1.year = 2009
  )
  AND a.author_id IN (
    SELECT al2.author_id
    FROM Author_list al2
    JOIN Paper p2 ON al2.paper_id = p2.paper_id
    WHERE p2.venue = 'ACL' AND p2.year = 2009
  )
