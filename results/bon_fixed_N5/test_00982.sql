SELECT DISTINCT p.paper_id, p.title
FROM Paper p
JOIN Author_list al ON p.paper_id = al.paper_id
JOIN Affiliation a ON al.affiliation_id = a.affiliation_id
WHERE a.name IN ('Stanford', 'Columbia University')
GROUP BY p.paper_id, p.title
HAVING COUNT(DISTINCT a.name) = 2;
