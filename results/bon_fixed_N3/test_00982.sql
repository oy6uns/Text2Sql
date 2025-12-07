SELECT DISTINCT p.paper_id, p.title
FROM Paper p
JOIN Author_list al1 ON p.paper_id = al1.paper_id
JOIN Affiliation a1 ON al1.affiliation_id = a1.affiliation_id
JOIN Author_list al2 ON p.paper_id = al2.paper_id
JOIN Affiliation a2 ON al2.affiliation_id = a2.affiliation_id
WHERE a1.name = 'Stanford' AND a2.name = 'Columbia University'
