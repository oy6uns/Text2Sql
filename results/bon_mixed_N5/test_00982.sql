SELECT DISTINCT p.paper_id, p.title
FROM Paper p
JOIN Author_list al1 ON p.paper_id = al1.paper_id
JOIN Affiliation af1 ON al1.affiliation_id = af1.affiliation_id
JOIN Author_list al2 ON p.paper_id = al2.paper_id
JOIN Affiliation af2 ON al2.affiliation_id = af2.affiliation_id
WHERE af1.name = 'Stanford' AND af2.name = 'Columbia University'
