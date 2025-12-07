SELECT a.name
FROM Affiliation a
JOIN Author_list al ON a.affiliation_id = al.affiliation_id
GROUP BY a.affiliation_id, a.name, a.address
HAVING a.address LIKE '%China%'
ORDER BY COUNT(DISTINCT al.paper_id) DESC
LIMIT 1;
