SELECT a.name
FROM Affiliation a
JOIN Author_list al ON a.affiliation_id = al.affiliation_id
GROUP BY a.name
ORDER BY COUNT(DISTINCT al.paper_id) DESC;
