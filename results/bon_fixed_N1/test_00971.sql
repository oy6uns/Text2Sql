SELECT COUNT(DISTINCT p.paper_id)
FROM Paper p
JOIN Author_list al ON p.paper_id = al.paper_id
JOIN Affiliation af ON al.affiliation_id = af.affiliation_id
WHERE p.year = 2009 AND af.name = 'Columbia University';
