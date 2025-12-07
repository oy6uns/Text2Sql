SELECT A.name
FROM Affiliation A
JOIN Author_list AL ON A.affiliation_id = AL.affiliation_id
GROUP BY A.name
ORDER BY COUNT(DISTINCT AL.paper_id) DESC;
