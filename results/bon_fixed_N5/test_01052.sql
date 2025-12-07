SELECT DISTINCT a.name
FROM Author a
WHERE a.author_id NOT IN (
    SELECT al.author_id
    FROM Author_list al
    JOIN Paper p ON al.paper_id = p.paper_id
    WHERE p.venue = 'ACL'
)
