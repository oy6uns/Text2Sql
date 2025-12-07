SELECT Affiliation.name, COUNT(DISTINCT Author_list.paper_id) AS paper_count
FROM Affiliation
JOIN Author_list ON Affiliation.affiliation_id = Author_list.affiliation_id
GROUP BY Affiliation.name
ORDER BY paper_count DESC;
