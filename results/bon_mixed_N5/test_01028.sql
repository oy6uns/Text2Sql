SELECT COUNT(DISTINCT p.paper_id)
FROM Paper p
JOIN Author_list al ON p.paper_id = al.paper_id
JOIN Affiliation af ON al.affiliation_id = af.affiliation_id
WHERE af.name = 'Stanford University' AND p.year BETWEEN 2000 AND 2009;
