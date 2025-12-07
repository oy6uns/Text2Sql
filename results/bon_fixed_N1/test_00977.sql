SELECT p.paper_id, p.title
FROM Paper p
JOIN Author_list al ON p.paper_id = al.paper_id
JOIN Affiliation af ON al.affiliation_id = af.affiliation_id
WHERE af.name = 'Harvard University';
