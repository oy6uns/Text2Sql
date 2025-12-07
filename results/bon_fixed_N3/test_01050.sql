SELECT DISTINCT a.name
FROM Author a
JOIN Author_list al ON a.author_id = al.author_id
JOIN Paper p ON al.paper_id = p.paper_id
WHERE p.year = 2009
AND a.author_id IN (
    SELECT al2.author_id
    FROM Author_list al2
    JOIN Paper p2 ON al2.paper_id = p2.paper_id
    WHERE p2.year = 2009 AND p2.venue = 'NAACL'
)
AND a.author_id IN (
    SELECT al3.author_id
    FROM Author_list al3
    JOIN Paper p3 ON al3.paper_id = p3.paper_id
    WHERE p3.year = 2009 AND p3.venue = 'ACL'
)
