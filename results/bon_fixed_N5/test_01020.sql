SELECT DISTINCT p.venue, p.year
FROM Paper p
JOIN Author_list al ON p.paper_id = al.paper_id
JOIN Affiliation af ON al.affiliation_id = af.affiliation_id
WHERE af.name = 'Columbia University'
