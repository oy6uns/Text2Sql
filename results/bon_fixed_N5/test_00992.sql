SELECT a.name, COUNT(DISTINCT al.paper_id) AS paper_count
FROM Affiliation a
LEFT JOIN Author_list al ON a.affiliation_id = al.affiliation_id
GROUP BY a.name
ORDER BY paper_count DESC;
