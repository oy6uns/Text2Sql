SELECT COUNT(DISTINCT p.paper_id)
FROM Paper p
JOIN Author_list al ON p.paper_id = al.paper_id
JOIN Affiliation a ON al.affiliation_id = a.affiliation_id
WHERE p.year = 2009 AND a.name = 'Columbia University';
