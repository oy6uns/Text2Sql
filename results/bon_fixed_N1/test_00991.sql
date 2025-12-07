SELECT 
    A.name, 
    COUNT(DISTINCT AL.paper_id) AS paper_count
FROM 
    Affiliation A
LEFT JOIN 
    Author_list AL ON A.affiliation_id = AL.affiliation_id
GROUP BY 
    A.name
ORDER BY 
    paper_count ASC;
