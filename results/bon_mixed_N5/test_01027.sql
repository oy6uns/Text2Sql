SELECT COUNT(DISTINCT al.paper_id)
FROM Author_list al
JOIN Affiliation a ON al.affiliation_id = a.affiliation_id
JOIN Paper p ON al.paper_id = p.paper_id
WHERE a.name = 'Stanford University' AND p.year BETWEEN 2000 AND 2009;
