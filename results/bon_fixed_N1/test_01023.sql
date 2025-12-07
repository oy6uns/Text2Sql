SELECT a.name
FROM Affiliation a
JOIN Author_list al ON a.affiliation_id = al.affiliation_id
JOIN Paper p ON al.paper_id = p.paper_id
WHERE p.year = 2009
GROUP BY a.name
ORDER BY COUNT(DISTINCT al.paper_id) DESC
LIMIT 3;
