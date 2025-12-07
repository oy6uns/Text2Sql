SELECT COUNT(DISTINCT al.paper_id) 
FROM Author_list al
JOIN Affiliation af ON al.affiliation_id = af.affiliation_id
JOIN Paper p ON al.paper_id = p.paper_id
WHERE af.name = 'Columbia University' AND p.year <= 2009;
