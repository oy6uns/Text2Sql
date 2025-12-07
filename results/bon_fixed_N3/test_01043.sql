SELECT a.affiliation_id, a.name, COUNT(DISTINCT al.paper_id) AS total_papers
FROM Affiliation a
LEFT JOIN Author_list al ON a.affiliation_id = al.affiliation_id
GROUP BY a.affiliation_id, a.name
ORDER BY total_papers DESC;
