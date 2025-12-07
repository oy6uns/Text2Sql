SELECT DISTINCT A.name
FROM Author A
LEFT JOIN Author_list AL ON A.author_id = AL.author_id
LEFT JOIN Paper P ON AL.paper_id = P.paper_id AND P.venue = 'ACL'
WHERE P.paper_id IS NULL;
