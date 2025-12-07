SELECT DISTINCT p.venue, p.year
FROM Paper p
JOIN Author_list al ON p.paper_id = al.paper_id
JOIN Affiliation a ON al.affiliation_id = a.affiliation_id
WHERE a.name = 'Columbia University';
