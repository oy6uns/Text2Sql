SELECT COUNT(DISTINCT al.paper_id) 
FROM Author_list al
JOIN Affiliation af ON al.affiliation_id = af.affiliation_id
JOIN Paper p ON al.paper_id = p.paper_id
WHERE af.name = 'Stanford University' 
  AND p.year BETWEEN 2000 AND 2009;
