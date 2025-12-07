SELECT COUNT(DISTINCT al.paper_id)
FROM Author_list al
JOIN Affiliation a ON al.affiliation_id = a.affiliation_id
JOIN Paper p ON al.paper_id = p.paper_id
WHERE a.name = 'Columbia University' AND p.year = 2009;
