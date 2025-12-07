SELECT p.paper_id, p.title
FROM Paper p
JOIN Author_list al_m ON p.paper_id = al_m.paper_id
JOIN Author a_m ON al_m.author_id = a_m.author_id
WHERE a_m.name LIKE '%Mckeown%'
AND p.paper_id NOT IN (
    SELECT al_r.paper_id
    FROM Author_list al_r
    JOIN Author a_r ON al_r.author_id = a_r.author_id
    WHERE a_r.name LIKE '%Rambow%'
)
